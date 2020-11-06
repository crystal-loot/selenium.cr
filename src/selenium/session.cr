class Selenium::Session
  getter http_client : HttpClient
  getter command_handler : CommandHandler
  getter id : SessionId

  def initialize(@http_client, @command_handler, @id)
  end

  def window_manager
    WindowManager.new(command_handler, id)
  end

  def document_manager
    DocumentManager.new(command_handler, id)
  end

  def navigation_manager
    NavigationManager.new(command_handler, id)
  end

  def cookie_manager
    CookieManager.new(command_handler, id)
  end

  def alert_manager
    AlertManager.new(command_handler, id)
  end

  def delete
    command_handler.execute(:delete_session, path_variables)
  end

  def navigate_to(url)
    command_handler.execute(:navigate_to, path_variables, {url: url})
  end

  def find_element(using : LocationStrategy, value)
    data = command_handler.execute(:find_element, path_variables, {
      using: using,
      value: value,
    })

    entry = data["value"].as_h
    Element.new(command_handler, id, entry.first_value.as_s)
  end

  def find_element(using : Symbol, value)
    find_element(LocationStrategy.from_symbol(using), value)
  end

  def find_elements(using : LocationStrategy, value)
    data = command_handler.execute(:find_elements, path_variables, {
      using: using,
      value: value,
    })

    element_ids = data["value"]
      .as_a
      .map { |entry| entry.as_h.first_value.as_s }
    element_ids.map { |element_id| Element.new(command_handler, id, element_id) }
  end

  def find_elements(using : Symbol, value)
    find_elements(LocationStrategy.from_symbol(using), value)
  end

  def active_element
    data = command_handler.execute(:get_active_element, path_variables)
    entry = data["value"].as_h
    Element.new(command_handler, id, entry.first_value.as_s)
  end

  def current_url
    data = command_handler.execute(:get_current_url, path_variables)
    data["value"].as_s
  end

  def title
    data = command_handler.execute(:get_title, path_variables)
    data["value"].as_s
  end

  def screenshot(file_path : String | File)
    data = command_handler.execute(:take_screenshot, path_variables)
    File.write(file_path.to_s, Base64.decode(data["value"].as_s))
  end

  def timeouts
    data = command_handler.execute(:get_timeouts, path_variables)
    TimeoutConfiguration.from_json(data["value"].to_json)
  end

  def set_timeouts(timeouts)
    command_handler.execute(:set_timeouts, path_variables, timeouts)
  end

  def perform_actions(action_sequence)
    parameters = {actions: action_sequence}
    command_handler.execute(:perform_actions, path_variables, parameters)
  end

  def release_actions
    command_handler.execute(:release_actions, path_variables)
  end

  # TODO: write test once it is understood:
  # - how to know/acquire the frame id
  # - what a frame is
  # - what switching frames will do
  def switch_to_frame(id)
    parameters = {id: id}
    command_handler.execute(:switch_to_frame, path_variables, parameters)
  end

  # TODO: reference switch_to_frame
  def switch_to_parent_frame
    command_handler.execute(:switch_to_parent_frame, path_variables)
  end

  def move_to(element : Selenium::Element)
    midpoint = element.rect.try(&.midpoint)
    return if midpoint.nil?

    move_to(x: midpoint.x, y: midpoint.y)
  end

  def move_to(x : Int32, y : Int32)
    sequence = Selenium::InputSourceActionSequence.new(
      type: "pointer",
      id: "action-sequence-key",
      actions: [Selenium::Action.new("pointerMove", x: x, y: y)]
    )
    perform_actions([sequence])
  end

  private def path_variables
    {":session_id" => id}
  end
end

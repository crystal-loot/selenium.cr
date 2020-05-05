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
    command_handler.execute(:navigate_to, path_variables, {url: url}.to_json)
  end

  def find_element(using, value)
    data = command_handler.execute(:find_element, path_variables, {
      using: using,
      value: value,
    }.to_json)

    entry = data["value"].as_h
    element_id = ElementId.new(entry.first_value.as_s)
    Element.new(command_handler, id, element_id)
  end

  def find_elements(using, value)
    data = command_handler.execute(:find_elements, path_variables, {
      using: using,
      value: value,
    }.to_json)

    element_ids = data["value"]
      .as_a
      .map { |entry| ElementId.new(entry.as_h.first_value.as_s) }
    element_ids.map { |element_id| Element.new(command_handler, id, element_id) }
  end

  def active_element
    data = command_handler.execute(:get_active_element, path_variables)
    entry = data["value"].as_h
    element_id = ElementId.new(entry.first_value.as_s)
    Element.new(command_handler, id, element_id)
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
    command_handler.execute(:set_timeouts, path_variables, timeouts.to_json)
  end

  def perform_actions(action_sequence)
    parameters = {actions: action_sequence}.to_json
    command_handler.execute(:perform_actions, path_variables, parameters)
  end

  def release_actions
    command_handler.execute(:release_actions, path_variables)
  end

  private def path_variables
    {":session_id" => id}
  end
end

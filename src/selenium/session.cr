class Selenium::Session
  getter http_client : HttpClient
  getter command_handler : CommandHandler
  getter id : SessionId

  def initialize(@http_client, @command_handler, @id)
  end

  def delete
    command_handler.execute(:delete_session, path_variables)
  end

  def window_manager
    WindowManager.new(self)
  end

  def document_manager
    DocumentManager.new(self)
  end

  def navigation_manager
    NavigationManager.new(self)
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
    Element.new(self, element_id)
  end

  def find_elements(using, value)
    data = command_handler.execute(:find_elements, path_variables, {
      using: using,
      value: value,
    }.to_json)

    element_ids = data["value"]
      .as_a
      .map { |entry| ElementId.new(entry.as_h.first_value.as_s) }
    element_ids.map { |element_id| Element.new(self, element_id) }
  end

  def current_url
    Command::GetCurrentUrl.new(http_client, id).execute
  end

  def title
    Command::GetTitle.new(http_client, id).execute
  end

  private def path_variables
    { ":session_id" => id }
  end
end

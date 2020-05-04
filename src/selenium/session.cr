class Selenium::Session
  getter http_client : HttpClient
  getter id : SessionId

  def initialize(@http_client, @id)
  end

  def delete
    Command::DeleteSession.new(http_client, id).execute
  end

  def window_manager
    WindowManager.new(self)
  end

  def navigate_to(url)
    Command::NavigateTo.new(http_client, id).execute(url)
  end

  def document_manager
    DocumentManager.new(self)
  end

  def find_element(using, value)
    element_id = Command::FindElement.new(http_client, id).execute(using, value)
    Element.new(self, element_id)
  end

  def find_elements(using, value)
    element_ids = Command::FindElements.new(http_client, id).execute(using, value)
    element_ids.map { |element_id| Element.new(self, element_id) }
  end

  def current_url
    Command::GetCurrentUrl.new(http_client, id).execute
  end
end

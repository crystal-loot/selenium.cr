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
end

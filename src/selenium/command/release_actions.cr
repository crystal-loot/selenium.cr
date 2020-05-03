class Selenium::Command::ReleaseActions
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute
    @http_client.delete("/session/#{@session_id}/actions")
  end
end

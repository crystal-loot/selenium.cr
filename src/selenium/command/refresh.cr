class Selenium::Command::Refresh
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute
    @http_client.post("/session/#{@session_id}/refresh")
  end
end

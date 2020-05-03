class Selenium::Command::GoForward
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute
    @http_client.post("/session/#{@session_id}/forward")
  end
end

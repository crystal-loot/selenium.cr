class Selenium::Command::CloseWindow
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute
    @http_client.delete("/session/#{@session_id}/window")
  end
end

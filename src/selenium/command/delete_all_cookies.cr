class Selenium::Command::DeleteAllCookies
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute
    @http_client.delete("/session/#{@session_id}/cookie")
  end
end

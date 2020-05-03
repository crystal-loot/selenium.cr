class Selenium::Command::DeleteCookie
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(name : String)
    @http_client.delete("/session/#{@session_id}/cookie/#{name}")
  end
end

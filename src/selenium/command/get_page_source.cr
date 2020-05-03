class Selenium::Command::GetPageSource
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute : String
    response_body = @http_client.get("/session/#{@session_id}/source")

    response_body["value"].as_s
  end
end

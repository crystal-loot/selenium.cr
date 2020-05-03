class Selenium::Command::TakeScreenshot
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute : Bytes
    response_body = @http_client.get("/session/#{@session_id}/screenshot")

    Base64.decode(response_body["value"].as_s)
  end
end

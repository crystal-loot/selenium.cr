class Selenium::Command::TakeElementScreenshot
  def initialize(@http_client : HttpClient, @session_id : SessionId, @element_id : ElementId)
  end

  def execute : Bytes
    response_body = @http_client.get("/session/#{@session_id}/element/#{@element_id}/screenshot")

    Base64.decode(response_body["value"].as_s)
  end
end

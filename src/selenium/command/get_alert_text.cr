class Selenium::Command::GetAlertText
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute : String
    response_body = @http_client.get("/session/#{@session_id}/alert/text")

    response_body["value"].as_s
  end
end

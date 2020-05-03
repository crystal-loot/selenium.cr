class Selenium::Command::SendAlertText
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(text : String)
    @http_client.post(
      "/session/#{@session_id}/alert/text",
      body: {text: text}.to_json
    )
  end
end

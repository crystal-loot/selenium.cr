class Selenium::Command::NewWindow
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute : WindowHandle
    response_body = @http_client.post("/session/#{@session_id}/window/new")

    response_body.dig("value", "handle").as_s
  end
end

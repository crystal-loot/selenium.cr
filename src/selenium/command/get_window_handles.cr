class Selenium::Command::GetWindowHandles
  def initialize(@http_client : HttpClient, @session_id : SessionId)
    @method = "GET"
    @route = "/session/#{@session_id}/window/handles"
  end

  def execute : Array(WindowHandle)
    response_body = @http_client.get("/session/#{@session_id}/window/handles")

    response_body["value"].as_a.map &.as_s
  end
end

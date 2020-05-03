class Selenium::Command::SwitchToWindow
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(handle : WindowHandle)
    @http_client.post("/session/#{@session_id}/window", body: {handle: handle}.to_json)
  end
end

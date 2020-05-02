class Selenium::Command::GetWindowHandle
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
    @method = "GET"
    @route = "/session/#{@session_id}/window"
  end

  def execute : WindowHandle
    response_body = @driver.get("/session/#{@session_id}/window")
    JSON.parse(response_body)["identifier"].as_s
  end
end

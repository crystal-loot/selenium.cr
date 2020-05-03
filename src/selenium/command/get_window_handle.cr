class Selenium::Command::GetWindowHandle
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute : WindowHandle
    response_body = @driver.get("/session/#{@session_id}/window")
    response_body["value"].as_s
  end
end

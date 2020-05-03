class Selenium::Command::NewWindow
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute : WindowHandle
    response_body = @driver.post("/session/#{@session_id}/window/new")

    response_body.dig("value", "handle").as_s
  end
end

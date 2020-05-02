class Selenium::Command::MaximizeWindow
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute : WindowRect
    response_body = @driver.post("/session/#{@session_id}/window/maximize")
    WindowRect.from_json(response_body)
  end
end

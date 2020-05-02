class Selenium::Command::GetWindowRect
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
  end

  def execute : WindowRect
    response_body = @driver.get("/session/#{@session_id}/window/rect")
    WindowRect.from_json(response_body)
  end
end

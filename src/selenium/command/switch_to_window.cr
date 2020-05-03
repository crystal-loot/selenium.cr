class Selenium::Command::SwitchToWindow
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute(handle : WindowHandle)
    @driver.post("/session/#{@session_id}/window", body: {handle: handle}.to_json)
  end
end

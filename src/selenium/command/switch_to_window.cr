class Selenium::Command::SwitchToWindow
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute(handle : WindowHandle)
    @driver.post("/session/#{@session_id}/window", body: {handle: handle}.to_json)
  end
end

class Selenium::Command::SwitchToParentFrame
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute
    @driver.post("/session/#{@session_id}/frame/parent")
  end
end

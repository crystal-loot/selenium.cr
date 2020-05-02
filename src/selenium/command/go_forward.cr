class Selenium::Command::GoForward
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute
    @driver.post("/session/#{@session_id}/forward")
  end
end

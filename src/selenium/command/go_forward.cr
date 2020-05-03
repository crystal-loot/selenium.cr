class Selenium::Command::GoForward
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute
    @driver.post("/session/#{@session_id}/forward")
  end
end

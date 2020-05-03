class Selenium::Command::Refresh
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute
    @driver.post("/session/#{@session_id}/refresh")
  end
end

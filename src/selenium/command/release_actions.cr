class Selenium::Command::ReleaseActions
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute
    @driver.delete("/session/#{@session_id}/actions")
  end
end

class Selenium::Command::GoBack
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute
    @driver.post("/session/#{@session_id}/back")
  end
end

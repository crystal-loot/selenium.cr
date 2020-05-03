class Selenium::Command::AcceptAlert
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute
    @driver.post("/session/#{@session_id}/alert/accept")
  end
end

class Selenium::Command::AcceptAlert
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute
    @driver.post("/session/#{@session_id}/alert/accept")
  end
end

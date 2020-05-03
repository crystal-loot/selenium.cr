class Selenium::Command::DismissAlert
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute
    @driver.post("/session/#{@session_id}/alert/dismiss")
  end
end

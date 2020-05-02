class Selenium::Command::DeleteSession
  def initialize(@driver : Driver::Deleteable, @session_id : SessionId)
  end

  def execute
    @driver.delete("/session/#{@session_id}")
  end
end

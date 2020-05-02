class Selenium::Command::DeleteSession
  getter driver : Driver::Deleteable

  def initialize(@driver, @session_id : SessionId)
  end

  def execute
    driver.delete("/session/#{@session_id}")
  end
end

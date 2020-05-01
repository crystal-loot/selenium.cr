class Selenium::Command::DeleteSession
  getter driver : Driver::Deleteable

  def initialize(@driver)
  end

  def execute(session_id : SessionId)
    driver.delete("/session/#{session_id}")
  end
end

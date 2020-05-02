class Selenium::Command::CloseWindow
  def initialize(@driver : Driver::Deleteable, @session_id : SessionId)
  end

  def execute
    @driver.delete("/session/#{@session_id}/window")
  end
end

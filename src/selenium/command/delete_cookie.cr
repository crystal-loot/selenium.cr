class Selenium::Command::DeleteCookie
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute(name : String)
    @driver.delete("/session/#{@session_id}/cookie/#{name}")
  end
end

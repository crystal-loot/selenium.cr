class Selenium::Command::GetCurrentUrl
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute : String
    response_body = @driver.get("/session/#{@session_id}/url")

    response_body["value"].as_s
  end
end

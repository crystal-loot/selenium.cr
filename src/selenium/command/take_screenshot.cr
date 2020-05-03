class Selenium::Command::TakeScreenshot
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute : Bytes
    response_body = @driver.get("/session/#{@session_id}/screenshot")

    Base64.decode(response_body["value"].as_s)
  end
end

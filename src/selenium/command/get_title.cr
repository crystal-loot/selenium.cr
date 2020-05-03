class Selenium::Command::GetTitle
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
  end

  def execute : String
    response_body = @driver.get("/session/#{@session_id}/title")
    response_body["value"].as_s
  end
end

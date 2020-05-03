class Selenium::Command::GetAlertText
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
  end

  def execute : String
    response_body = @driver.get("/session/#{@session_id}/alert/text")

    response_body["value"].as_s
  end
end

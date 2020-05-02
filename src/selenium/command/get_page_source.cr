class Selenium::Command::GetPageSource
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
  end

  def execute : String
    response_body = @driver.get("/session/#{@session_id}/source")

    response_body["value"].as_s
  end
end

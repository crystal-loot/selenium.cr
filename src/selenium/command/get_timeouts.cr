class Selenium::Command::GetTimeouts
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
  end

  def execute : TimeoutConfiguration
    response_body = @driver.get("/session/#{@session_id}/timeouts")

    TimeoutConfiguration.from_json(response_body["value"].to_json)
  end
end

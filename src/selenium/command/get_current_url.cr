class Selenium::Command::GetCurrentUrl
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
  end

  def execute : String
    response_body = @driver.get("/session/#{@session_id}/url")

    response_body.dig("value", "url").as_s
  end
end

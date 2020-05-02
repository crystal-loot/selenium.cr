class Selenium::Command::GetCurrentUrl
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
  end

  def execute
    response_body = @driver.get("/session/#{@session_id}/url")

    JSON.parse(response_body)["url"].as_s
  end
end

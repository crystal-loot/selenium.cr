class Selenium::Command::GetAllCookies
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute : Array(Cookie)
    response_body = @driver.get("/session/#{@session_id}/cookie")

    Array(Cookie).from_json(response_body["value"].to_json)
  end
end

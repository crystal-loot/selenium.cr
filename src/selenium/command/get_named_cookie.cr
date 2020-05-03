class Selenium::Command::GetNamedCookie
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute(name : String) : Cookie
    response_body = @driver.get("/session/#{@session_id}/cookie/#{name}")

    Cookie.from_json(response_body["value"].to_json)
  end
end

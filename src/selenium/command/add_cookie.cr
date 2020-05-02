class Selenium::Command::AddCookie
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute(cookie : Cookie)
    response_body = @driver.post(
      "/session/#{@session_id}/cookie",
      body: {
        cookie: cookie,
      }.to_json
    )
  end
end

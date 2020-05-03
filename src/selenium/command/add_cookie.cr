class Selenium::Command::AddCookie
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(cookie : Cookie)
    response_body = @http_client.post(
      "/session/#{@session_id}/cookie",
      body: {
        cookie: cookie,
      }.to_json
    )
  end
end

class Selenium::Command::GetNamedCookie
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(name : String) : Cookie
    response_body = @http_client.get("/session/#{@session_id}/cookie/#{name}")

    Cookie.from_json(response_body["value"].to_json)
  end
end

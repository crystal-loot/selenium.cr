class Selenium::Command::GetAllCookies
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute : Array(Cookie)
    response_body = @http_client.get("/session/#{@session_id}/cookie")

    Array(Cookie).from_json(response_body["value"].to_json)
  end
end

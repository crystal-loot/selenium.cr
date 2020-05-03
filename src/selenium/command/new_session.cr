class Selenium::Command::NewSession
  def initialize(@http_client : HttpClient)
  end

  def execute(capabilities : Hash(String, _) = {} of String => String) : SessionId
    response_body = @http_client.post("/session", {capabilities: capabilities}.to_json)
    response_body.dig("value", "sessionId").as_s
  end
end

class Selenium::Command::GetTimeouts
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute : TimeoutConfiguration
    response_body = @http_client.get("/session/#{@session_id}/timeouts")

    TimeoutConfiguration.from_json(response_body["value"].to_json)
  end
end

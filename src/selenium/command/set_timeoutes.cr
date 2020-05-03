class Selenium::Command::SetTimeouts
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(timeout_configuration : TimeoutConfiguration)
    @http_client.post(
      "/session/#{@session_id}/timeouts",
      body: timeout_configuration.to_json
    )
  end
end

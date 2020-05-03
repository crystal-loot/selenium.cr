class Selenium::Command::PerformActions
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(action_sequence : ActionSequence)
    @http_client.post(
      "/session/#{@session_id}/actions",
      body: {actions: action_sequence}.to_json
    )
  end
end

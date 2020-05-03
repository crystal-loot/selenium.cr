class Selenium::Command::ExecuteScript
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  # the response is the result of the script so it could be anything
  def execute(script : String, args : Array(_) = [] of String) : String
    response_body = @http_client.post(
      "/session/#{@session_id}/execute/sync",
      body: {
        script: script,
        args:   args,
      }.to_json
    )

    value = response_body["value"]

    value.as_s? || value.to_json
  end
end

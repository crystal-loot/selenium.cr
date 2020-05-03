class Selenium::Command::ExecuteAsyncScript
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  # the response is the result of the script so it could be anything
  def execute(script : String, args : Array(_) = [] of String) : String
    response_body = @driver.post(
      "/session/#{@session_id}/execute/async",
      body: {
        script: script,
        args:   args,
      }.to_json
    )

    value = response_body["value"]

    value.as_s? || value.to_json
  end
end

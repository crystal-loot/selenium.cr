class Selenium::Command::ExecuteScript
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute(script : String, args : Array(_) = [] of String) : String
    response_body = @driver.post(
      "/session/#{@session_id}/execute/sync",
      body: {
        script: script,
        args:   args,
      }.to_json
    )

    response_body["value"].as_s
  end
end

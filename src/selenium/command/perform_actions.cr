class Selenium::Command::PerformActions
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute(action_sequence : ActionSequence)
    @driver.post(
      "/session/#{@session_id}/actions",
      body: {actions: action_sequence}.to_json
    )
  end
end

class Selenium::Command::SwitchToFrame
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute(id : Int32?)
    @driver.post(
      "/session/#{@session_id}/frame",
      body: {id: id}.to_json
    )
  end
end

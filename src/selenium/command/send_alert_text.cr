class Selenium::Command::SendAlertText
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute(text : String)
    @driver.post(
      "/session/#{@session_id}/alert/text",
      body: {text: text}.to_json
    )
  end
end

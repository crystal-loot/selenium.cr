class Selenium::Command::SendAlertText
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/alert/text"
  end
end

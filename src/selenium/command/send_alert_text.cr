class Selenium::Command::SendAlertText
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/alert/text"
  end
end

class Selenium::Command::GetAlertText
  def initialize(@session_id : UUID)
    @method = "GET"
    @route = "/session/#{@session_id}/alert/text"
  end
end

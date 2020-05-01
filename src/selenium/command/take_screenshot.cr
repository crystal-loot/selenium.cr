class Selenium::Command::TakeScreenshot
  def initialize(@session_id)
    @method = "GET"
    @route = "/session/#{@session_id}/screenshot"
  end
end

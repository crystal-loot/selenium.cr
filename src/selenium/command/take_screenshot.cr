class Selenium::Command::TakeScreenshot
  def initialize(@session_id : UUID)
    @method = "GET"
    @route = "/session/#{@session_id}/screenshot"
  end
end

class Selenium::Command::GetWindowHandle
  def initialize(@session_id : UUID)
    @method = "GET"
    @route = "/session/#{@session_id}/window"
  end
end

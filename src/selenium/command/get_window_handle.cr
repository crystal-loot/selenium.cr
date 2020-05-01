class Selenium::Command::GetWindowHandle
  def initialize(@session_id)
    @method = "GET"
    @route = "/session/#{@session_id}/window"
  end
end

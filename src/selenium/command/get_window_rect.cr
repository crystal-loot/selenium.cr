class Selenium::Command::GetWindowRect
  def initialize(@session_id : UUID)
    @method = "GET"
    @route = "/session/#{@session_id}/window/rect"
  end
end

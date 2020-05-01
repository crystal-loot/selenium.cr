class Selenium::Command::SetWindowRect
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/window/rect"
  end
end

class Selenium::Command::SetWindowRect
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/window/rect"
  end
end

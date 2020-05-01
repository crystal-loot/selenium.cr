class Selenium::Command::FullscreenWindow
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/window/fullscreen"
  end
end

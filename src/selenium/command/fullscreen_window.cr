class Selenium::Command::FullscreenWindow
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/window/fullscreen"
  end
end

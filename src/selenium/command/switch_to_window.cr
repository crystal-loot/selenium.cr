class Selenium::Command::SwitchToWindow
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/window"
  end
end

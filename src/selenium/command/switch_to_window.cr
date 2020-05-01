class Selenium::Command::SwitchToWindow
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/window"
  end
end

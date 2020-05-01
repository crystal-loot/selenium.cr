class Selenium::Command::SwitchToFrame
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/frame"
  end
end

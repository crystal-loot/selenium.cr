class Selenium::Command::SwitchToParentFrame
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/frame/parent"
  end
end

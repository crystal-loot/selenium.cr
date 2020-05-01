class Selenium::Command::SwitchToParentFrame
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/frame/parent"
  end
end

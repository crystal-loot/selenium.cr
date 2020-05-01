class Selenium::Command::DismissAlert
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/alert/dismiss"
  end
end

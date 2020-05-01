class Selenium::Command::GoForward
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/forward"
  end
end

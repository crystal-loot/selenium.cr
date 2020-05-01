class Selenium::Command::GoForward
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/forward"
  end
end

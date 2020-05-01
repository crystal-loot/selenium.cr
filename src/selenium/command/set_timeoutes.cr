class Selenium::Command::SetTimeouts
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/timeouts"
  end
end

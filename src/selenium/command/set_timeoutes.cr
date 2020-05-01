class Selenium::Command::SetTimeouts
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/timeouts"
  end
end

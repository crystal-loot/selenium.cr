class Selenium::Command::GetTimeouts
  def initialize(@session_id)
    @method = "GET"
    @route = "/session/#{@session_id}/timeouts"
  end
end

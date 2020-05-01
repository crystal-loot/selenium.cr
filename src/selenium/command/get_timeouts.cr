class Selenium::Command::GetTimeouts
  def initialize(@session_id : UUID)
    @method = "GET"
    @route = "/session/#{@session_id}/timeouts"
  end
end

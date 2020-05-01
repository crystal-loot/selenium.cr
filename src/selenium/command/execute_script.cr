class Selenium::Command::ExecuteScript
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/execute/sync"
  end
end

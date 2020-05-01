class Selenium::Command::ExecuteAsyncScript
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/execute/async"
  end
end

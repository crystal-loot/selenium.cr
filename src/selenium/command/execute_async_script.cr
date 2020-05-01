class Selenium::Command::ExecuteAsyncScript
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/execute/async"
  end
end

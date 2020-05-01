class Selenium::Command::DeleteSession
  def initialize(@session_id : UUID)
    @method = "DELETE"
    @route = "/session/#{@session_id}"
  end
end

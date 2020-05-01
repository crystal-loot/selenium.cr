class Selenium::Command::NewSession
  def initialize(@session_id)
    @method = "DELETE"
    @route = "/session/#{@session_id}"
  end
end

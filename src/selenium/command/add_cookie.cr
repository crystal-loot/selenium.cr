class Selenium::Command::AddCookie
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/cookie"
  end
end

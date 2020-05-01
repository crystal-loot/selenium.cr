class Selenium::Command::AddCookie
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/cookie"
  end
end

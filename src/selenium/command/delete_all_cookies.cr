class Selenium::Command::DeleteAllCookies
  def initialize(@session_id : UUID)
    @method = "DELETE"
    @route = "/session/#{@session_id}/cookie"
  end
end

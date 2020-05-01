class Selenium::Command::GetAllCookies
  def initialize(@session_id)
    @method = "GET"
    @route = "/session/#{@session_id}/cookie"
  end
end

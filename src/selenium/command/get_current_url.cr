class Selenium::Command::GetCurrentUrl
  def initialize(@session_id : UUID)
    @method = "GET"
    @route = "/session/#{@session_id}/url"
  end
end

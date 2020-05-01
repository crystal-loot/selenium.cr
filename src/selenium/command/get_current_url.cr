class Selenium::Command::GetCurrentUrl
  def initialize(@session_id)
    @method = "GET"
    @route = "/session/#{@session_id}/url"
  end
end

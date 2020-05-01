class Selenium::Command::GetPageSource
  def initialize(@session_id)
    @method = "GET"
    @route = "/session/#{@session_id}/source"
  end
end

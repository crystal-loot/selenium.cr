class Selenium::Command::GetPageSource
  def initialize(@session_id : UUID)
    @method = "GET"
    @route = "/session/#{@session_id}/source"
  end
end

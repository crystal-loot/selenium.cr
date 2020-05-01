class Selenium::Command::GetWindowHandles
  def initialize(@session_id)
    @method = "GET"
    @route = "/session/#{@session_id}/window/handles"
  end
end

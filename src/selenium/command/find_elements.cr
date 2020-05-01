class Selenium::Command::FindElements
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/elements"
  end
end

class Selenium::Command::FindElements
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/elements"
  end
end

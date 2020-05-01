class Selenium::Command::FindElement
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/element"
  end
end

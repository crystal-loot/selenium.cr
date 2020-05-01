class Selenium::Command::FindElement
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/element"
  end
end

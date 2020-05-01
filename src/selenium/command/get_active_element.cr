class Selenium::Command::GetActiveElement
  def initialize(@session_id : UUID)
    @method = "GET"
    @route = "/session/#{@session_id}/element/active"
  end
end

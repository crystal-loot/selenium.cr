class Selenium::Command::PrintPage
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/print"
  end
end

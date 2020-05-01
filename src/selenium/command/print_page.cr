class Selenium::Command::PrintPage
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/print"
  end
end

class Selenium::Command::AcceptAlert
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/alert/accept"
  end
end

class Selenium::Command::AcceptAlert
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/alert/accept"
  end
end

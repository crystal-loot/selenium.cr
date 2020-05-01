class Selenium::Command::Refresh
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/refresh"
  end
end

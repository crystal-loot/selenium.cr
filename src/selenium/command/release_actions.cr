class Selenium::Command::ReleaseActions
  def initialize(@session_id)
    @method = "DELETE"
    @route = "/session/#{@session_id}/actions"
  end
end

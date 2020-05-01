class Selenium::Command::PerformActions
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/actions"
  end
end

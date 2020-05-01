class Selenium::Command::PerformActions
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/actions"
  end
end

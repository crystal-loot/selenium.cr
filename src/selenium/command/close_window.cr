class Selenium::Command::CloseWindow
  def initialize(@session_id)
    @method = "DELETE"
    @route = "/session/#{@session_id}/window"
  end
end

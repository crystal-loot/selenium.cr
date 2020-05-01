class Selenium::Command::CloseWindow
  def initialize(@session_id : UUID)
    @method = "DELETE"
    @route = "/session/#{@session_id}/window"
  end
end

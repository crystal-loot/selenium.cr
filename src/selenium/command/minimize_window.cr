class Selenium::Command::MinimizeWindow
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/window/minimize"
  end
end

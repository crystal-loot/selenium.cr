class Selenium::Command::MaximizeWindow
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/window/maximize"
  end
end

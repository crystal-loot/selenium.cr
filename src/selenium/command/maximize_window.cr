class Selenium::Command::MaximizeWindow
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/window/maximize"
  end
end

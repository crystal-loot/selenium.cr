class Selenium::Command::NewWindow
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/windows/new"
  end
end

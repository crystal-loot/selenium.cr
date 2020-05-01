class Selenium::Command::NewWindow
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/windows/new"
  end
end

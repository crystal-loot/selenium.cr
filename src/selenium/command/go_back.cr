class Selenium::Command::GoBack
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/back"
  end
end

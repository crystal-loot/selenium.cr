class Selenium::Command::GoBack
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/back"
  end
end

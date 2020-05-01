class Selenium::Command::NavigateTo
  def initialize(@session_id : UUID)
    @method = "POST"
    @route = "/session/#{@session_id}/url"
  end
end

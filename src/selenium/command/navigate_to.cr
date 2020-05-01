class Selenium::Command::NavigateTo
  def initialize(@session_id)
    @method = "POST"
    @route = "/session/#{@session_id}/url"
  end
end

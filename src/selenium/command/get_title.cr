class Selenium::Command::GetTitle
  def initialize(@driver : Driver::Getable, @session_id : UUID)
    @method = "GET"
    @route = "/session/#{@session_id}/title"
  end

  def execute : String
    response_body = @driver.get("/session/#{@session_id}/title")
    JSON.parse(response_body)["title"].as_s
  end
end

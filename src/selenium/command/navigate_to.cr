class Selenium::Command::NavigateTo
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute(url)
    body = {url: url}.to_json
    @driver.post("/session/#{@session_id}/url", body)
  end
end

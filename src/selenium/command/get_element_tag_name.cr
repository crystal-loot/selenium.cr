class Selenium::Command::GetElementTagName
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute(element_id : ElementId) : String
    response_body = @driver.get("/session/#{@session_id}/element/#{element_id}/name")

    response_body["value"].as_s
  end
end

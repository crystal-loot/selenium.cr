class Selenium::Command::GetElementAttribute
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute(element_id : ElementId, name : String) : String
    response_body = @driver.get("/session/#{@session_id}/element/#{element_id}/attribute/#{name}")

    response_body["value"].as_s
  end
end

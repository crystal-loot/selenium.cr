class Selenium::Command::GetActiveElement
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
  end

  def execute : ElementId
    response_body = @driver.get("/session/#{@session_id}/element/active")

    entry = response_body["value"].as_h
    ElementId.new(entry.first_value.as_s)
  end
end

class Selenium::Command::GetActiveElement
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
  end

  def execute : ElementId
    response_body = @driver.get("/session/#{@session_id}/element/active")

    entry = JSON.parse(response_body)
    ElementId.new(entry.as_h.first_value.as_s)
  end
end

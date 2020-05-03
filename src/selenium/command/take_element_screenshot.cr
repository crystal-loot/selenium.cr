class Selenium::Command::TakeElementScreenshot
  def initialize(@driver : Driver::Getable, @session_id : SessionId, @element_id : ElementId)
  end

  def execute : Bytes
    response_body = @driver.get("/session/#{@session_id}/element/#{@element_id}/screenshot")

    Base64.decode(response_body["value"].as_s)
  end
end

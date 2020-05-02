class Selenium::Command::ElementClick
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
  end

  def execute(element_id : ElementId)
    @driver.post("/session/#{@session_id}/element/#{element_id}/click")
  end
end

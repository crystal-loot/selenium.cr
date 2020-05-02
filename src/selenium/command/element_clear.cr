class Selenium::Command::ElementClear
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
  end

  def execute(element_id : ElementId)
    @driver.post("/session/#{@session_id}/element/#{element_id}/clear")
  end
end

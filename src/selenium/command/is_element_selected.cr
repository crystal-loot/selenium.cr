class Selenium::Command::IsElementSelected
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute(element_id : ElementId) : Bool
    response_body = @driver.get("/session/#{@session_id}/element/#{element_id}/selected")

    response_body["value"].as_bool
  end
end

class Selenium::Command::GetElementRect
  def initialize(@driver : Driver::Getable, @session_id : SessionId)
  end

  def execute(element_id : ElementId) : ElementRect
    response_body = @driver.get("/session/#{@session_id}/element/#{element_id}/rect")

    x = response_body.dig("value", "x").as_i
    y = response_body.dig("value", "y").as_i
    width = response_body.dig("value", "width").as_i
    height = response_body.dig("value", "height").as_i

    ElementRect.new(x, y, width, height)
  end
end

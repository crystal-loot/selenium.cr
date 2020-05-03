class Selenium::Command::MinimizeWindow
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute : WindowRect
    response_body = @driver.post("/session/#{@session_id}/window/minimize")

    x = response_body.dig("value", "x").as_i
    y = response_body.dig("value", "y").as_i
    width = response_body.dig("value", "width").as_i
    height = response_body.dig("value", "height").as_i

    WindowRect.new(x, y, width, height)
  end
end

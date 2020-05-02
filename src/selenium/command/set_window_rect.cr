class Selenium::Command::SetWindowRect
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute(
    width : Int32? = nil,
    height : Int32? = nil,
    x : Int32? = nil,
    y : Int32? = nil
  ) : WindowRect
    response_body = @driver.post(
      "/session/#{@session_id}/window/rect",
      body: {
        width:  width,
        height: height,
        x:      x,
        y:      y,
      }.to_json
    )

    new_x = response_body.dig("value", "x").as_i
    new_y = response_body.dig("value", "y").as_i
    new_width = response_body.dig("value", "width").as_i
    new_height = response_body.dig("value", "height").as_i

    WindowRect.new(new_x, new_y, new_width, new_height)
  end
end

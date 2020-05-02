class Selenium::Command::SetWindowRect
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute(width : Int32?, height : Int32?, x : Int32?, y : Int32?) : WindowRect
    response_body = @driver.post(
      "/session/#{@session_id}/window/rect",
      body: {
        width:  width,
        height: height,
        x:      x,
        y:      y,
      }.to_json
    )

    WindowRect.from_json(response_body)
  end
end

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

    WindowRect.from_json(response_body)
  end
end

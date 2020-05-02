class Selenium::Command::FindElement
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute(using : LocationStrategy, value : String) : Array(Element)
    response_body = @driver.post(
      "/session/#{@session_id}/element",
      body: {
        using: using,
        value: value
      }.to_json
    )

    Array(Element).from_json(response_body)
  end
end

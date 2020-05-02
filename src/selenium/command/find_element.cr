class Selenium::Command::FindElement
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute(using : LocationStrategy, value : String) : ElementId
    response_body = @driver.post(
      "/session/#{@session_id}/element",
      body: {
        using: using,
        value: value,
      }.to_json
    )

    entry = JSON.parse(response_body)
    ElementId.new(entry.as_h.first_value.as_s)
  end
end

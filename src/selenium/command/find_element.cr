class Selenium::Command::FindElement
  def initialize(@driver : Driver, @session_id : SessionId)
  end

  def execute(using : LocationStrategy, value : String) : ElementId
    response_body = @driver.post(
      "/session/#{@session_id}/element",
      body: {
        using: using,
        value: value,
      }.to_json
    )

    entry = response_body["value"].as_h
    ElementId.new(entry.first_value.as_s)
  end
end

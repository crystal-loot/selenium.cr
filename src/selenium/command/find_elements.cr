class Selenium::Command::FindElements
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute(using : LocationStrategy, value : String) : Array(ElementId)
    response_body = @driver.post(
      "/session/#{@session_id}/elements",
      body: {
        using: using,
        value: value,
      }.to_json
    )

    response_body["value"]
      .as_a
      .map { |entry| ElementId.new(entry.as_h.first_value.as_s) }
  end
end

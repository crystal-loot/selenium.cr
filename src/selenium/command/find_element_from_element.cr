class Selenium::Command::FindElementFromElement
  def initialize(
    @driver : Driver,
    @session_id : SessionId,
    @parent_element_id : ElementId
  )
  end

  def execute(using : LocationStrategy, value : String) : ElementId
    response_body = @driver.post(
      "/session/#{@session_id}/element/#{@parent_element_id}/element",
      body: {
        using: using,
        value: value,
      }.to_json
    )

    entry = response_body["value"].as_h
    ElementId.new(entry.first_value.as_s)
  end
end

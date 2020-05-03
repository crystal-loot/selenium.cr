class Selenium::Command::FindElementFromElement
  def initialize(
    @http_client : HttpClient,
    @session_id : SessionId,
    @parent_element_id : ElementId
  )
  end

  def execute(using : LocationStrategy, value : String) : ElementId
    response_body = @http_client.post(
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

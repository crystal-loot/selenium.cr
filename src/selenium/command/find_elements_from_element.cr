class Selenium::Command::FindElementsFromElement
  def initialize(
    @http_client : HttpClient,
    @session_id : SessionId,
    @parent_element_id : ElementId
  )
  end

  def execute(using : LocationStrategy, value : String) : Array(ElementId)
    response_body = @http_client.post(
      "/session/#{@session_id}/element/#{@parent_element_id}/elements",
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

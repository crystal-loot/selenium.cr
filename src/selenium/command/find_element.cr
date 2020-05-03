class Selenium::Command::FindElement
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(using : LocationStrategy, value : String) : ElementId
    response_body = @http_client.post(
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

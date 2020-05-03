class Selenium::Command::GetActiveElement
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute : ElementId
    response_body = @http_client.get("/session/#{@session_id}/element/active")

    entry = response_body["value"].as_h
    ElementId.new(entry.first_value.as_s)
  end
end

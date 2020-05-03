class Selenium::Command::GetElementTagName
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(element_id : ElementId) : String
    response_body = @http_client.get("/session/#{@session_id}/element/#{element_id}/name")

    response_body["value"].as_s
  end
end

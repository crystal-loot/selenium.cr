class Selenium::Command::IsElementEnabled
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(element_id : ElementId) : Bool
    response_body = @http_client.get("/session/#{@session_id}/element/#{element_id}/enabled")

    response_body["value"].as_bool
  end
end

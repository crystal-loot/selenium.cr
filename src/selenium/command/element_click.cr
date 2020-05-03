class Selenium::Command::ElementClick
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(element_id : ElementId)
    @http_client.post("/session/#{@session_id}/element/#{element_id}/click")
  end
end

class Selenium::Command::NavigateTo
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(url)
    body = {url: url}.to_json
    @http_client.post("/session/#{@session_id}/url", body)
  end
end

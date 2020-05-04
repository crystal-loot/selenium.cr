class Selenium::Command::GetStatus
  def initialize(@http_client : HttpClient)
  end

  def execute : Status
    response_body = @http_client.get("/status")

    Status.from_json(response_body["value"].to_json)
  end
end

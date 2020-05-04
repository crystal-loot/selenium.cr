class Selenium::Command::ElementSendKeys
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(element_id : ElementId, keys : Array(String | Symbol))
    response_body = @http_client.post(
      "/session/#{@session_id}/element/#{element_id}/value",
      body: {text: SendKeyConverter.encode(keys)}.to_json
    )
  end
end

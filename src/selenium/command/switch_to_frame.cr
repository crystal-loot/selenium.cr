class Selenium::Command::SwitchToFrame
  def initialize(@http_client : HttpClient, @session_id : SessionId)
  end

  def execute(id : Int32?)
    @http_client.post(
      "/session/#{@session_id}/frame",
      body: {id: id}.to_json
    )
  end
end

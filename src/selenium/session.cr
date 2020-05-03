class Selenium::Session
  getter http_client : HttpClient
  getter id : SessionId

  def initialize(@http_client, @id)
  end

  def delete
    Command::DeleteSession.new(http_client, id).execute
  end
end

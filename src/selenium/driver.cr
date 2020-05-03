class Selenium::Driver
  getter http_client : HttpClient

  def initialize(@http_client = HttpClient.new)
  end

  def create_session : Session
    session_id = Command::NewSession.new(http_client).execute

    Session.new(http_client, session_id)
  end

  def status : Status
    Command::GetStatus.new(http_client).execute
  end
end

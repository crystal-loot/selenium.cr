class Selenium::NavigationManager
  getter session : Session

  def initialize(@session)
  end

  def go_back
    Command::GoBack.new(http_client, session_id).execute
  end

  def go_forward
    Command::GoForward.new(http_client, session_id).execute
  end

  def refresh
    Command::Refresh.new(http_client, session_id).execute
  end

  private def http_client
    session.http_client
  end

  private def session_id
    session.id
  end
end

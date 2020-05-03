class Selenium::DocumentManager
  getter session : Session

  def initialize(@session)
  end

  def page_source
    Command::GetPageSource.new(http_client, session_id).execute
  end

  def execute_script(script, args : Array(_) = [] of String)
    Command::ExecuteScript.new(http_client, session_id).execute(script, args)
  end

  def execute_async_script(script, args : Array(_) = [] of String)
    Command::ExecuteAsyncScript.new(http_client, session_id).execute(script, args)
  end

  private def http_client
    session.http_client
  end

  private def session_id
    session.id
  end
end

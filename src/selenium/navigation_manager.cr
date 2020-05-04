class Selenium::NavigationManager
  getter session : Session
  getter command_handler : CommandHandler

  def initialize(@session, @command_handler)
  end

  def go_back
    command_handler.execute(:back, path_variables)
  end

  def go_forward
    command_handler.execute(:forward, path_variables)
  end

  def refresh
    command_handler.execute(:refresh, path_variables)
  end

  private def path_variables
    {":session_id" => session.id}
  end
end

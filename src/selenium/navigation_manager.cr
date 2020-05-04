class Selenium::NavigationManager
  getter command_handler : CommandHandler
  getter session_id : SessionId

  def initialize(@command_handler, @session_id)
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
    {":session_id" => session_id}
  end
end

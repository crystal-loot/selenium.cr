class Selenium::AlertManager
  getter command_handler : CommandHandler
  getter session_id : SessionId

  def initialize(@command_handler, @session_id)
  end

  def send_alert_text(text)
    parameters = {text: text}
    command_handler.execute(:send_alert_text, path_variables, parameters)
  end

  def alert_text
    data = command_handler.execute(:get_alert_text, path_variables)

    data["value"].as_s
  end

  def accept_alert
    command_handler.execute(:accept_alert, path_variables)
  end

  def dismiss_alert
    command_handler.execute(:dismiss_alert, path_variables)
  end

  private def path_variables
    {":session_id" => session_id}
  end
end

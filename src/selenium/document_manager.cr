class Selenium::DocumentManager
  getter command_handler : CommandHandler
  getter session_id : SessionId

  def initialize(@command_handler, @session_id)
  end

  def page_source
    data = command_handler.execute(:get_page_source, path_variables)
    data["value"].as_s
  end

  def execute_script(script, args : Array(_) = [] of String)
    parameters = {
      script: script,
      args:   args,
    }
    data = command_handler.execute(:execute_script, path_variables, parameters)
    data["value"].as_s? || data["value"].to_json
  end

  def execute_async_script(script, args : Array(_) = [] of String)
    parameters = {
      script: script,
      args:   args,
    }
    data = command_handler.execute(:execute_async_script, path_variables, parameters)
    data["value"].as_s? || data["value"].to_json
  end

  def path_variables
    {":session_id" => session_id}
  end
end

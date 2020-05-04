class Selenium::CommandHandler
  include DefaultCommands
  getter http_client : HttpClient

  def initialize(@http_client)
  end

  def execute(command : Symbol, path_variables : Hash(String, String) = {} of String => String, parameters = "{}") : JSON::Any
    method, path = DEFAULT_COMMANDS[command]
    full_path = path_variables.reduce(path) { |acc, entry| acc.sub(entry.first, entry.last) }

    execute(method, full_path, parameters)
  end

  private def execute(method, full_path, parameters) : JSON::Any
    case method
    when :get
      http_client.get(full_path)
    when :delete
      http_client.delete(full_path).as(JSON::Any)
    when :post
      http_client.post(full_path, parameters)
    else
      raise "Woops!"
    end
  end
end

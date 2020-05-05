class Selenium::Remote::Driver
  getter http_client : HttpClient
  getter command_handler : CommandHandler

  def initialize(opts, @http_client = HttpClient.new)
    @command_handler = CommandHandler.new(@http_client)
  end

  def create_session(capabilities) : Session
    parameters = {capabilities: {alwaysMatch: capabilities}}.to_json
    data = command_handler.execute(:new_session, parameters: parameters)

    Session.new(http_client, command_handler, data.dig("value", "sessionId").as_s)
  end

  def status : Status
    data = command_handler.execute(:status)

    Status.from_json(data["value"].to_json)
  end
end

class Selenium::Driver
  getter http_client : HttpClient
  getter command_handler : CommandHandler

  def initialize(@http_client = HttpClient.new)
    @command_handler = CommandHandler.new(@http_client)
  end

  def create_session(capabilities : Hash(String, _) = {} of String => String) : Session
    data = command_handler.execute(:new_session, parameters: {capabilities: capabilities}.to_json)

    Session.new(http_client, data.dig("value", "sessionId").as_s)
  end

  def status : Status
    data = command_handler.execute(:status)

    Status.from_json(data["value"].to_json)
  end
end

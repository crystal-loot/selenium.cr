class Selenium::Driver
  def self.for(browser, **opts)
    case browser
    when :chrome
      Chrome::Driver.new(**opts)
    when :firefox, :gecko
      Firefox::Driver.new(**opts)
    when :remote
      Remote::Driver.new(**opts)
    else
      raise ArgumentError.new "unknown driver: #{browser}"
    end
  end

  getter http_client : HttpClient
  getter command_handler : CommandHandler
  getter service : Service?

  def initialize(base_url : String? = nil, @service : Service? = nil)
    @service.try &.start
    base_url ||= @service.not_nil!.base_url
    @http_client = HttpClient.new(base_url: base_url)
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

  def stop
    service.try &.stop
  end
end

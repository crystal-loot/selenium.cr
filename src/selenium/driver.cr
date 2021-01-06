# The `Selenium::Driver` is the root class for interacting with browsers
#
# ### Using with `Selenium::Service`
#
# If you passed in a `Selenium::Service` you *MUST* call `Selenium::Driver#stop` when you are done to stop the service
# or else the process it starts will continue running on your computer after the program ends
abstract class Selenium::Driver
  # *browser* options:
  # - :chrome (see `Selenium::Chrome::Driver`)
  # - :firefox or :gecko (see `Selenium::Firefox::Driver`)
  # - :safari (see `Selenium::Safari::Driver`)
  # - :remote (see `Selenium::Remote::Driver`)
  def self.for(browser, **opts)
    case browser
    when :chrome
      Chrome::Driver.new(**opts)
    when :firefox, :gecko
      Firefox::Driver.new(**opts)
    when :remote
      Remote::Driver.new(**opts)
    when :safari
      Safari::Driver.new(**opts)
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

  abstract def create_session(args : Array(String)) : Session

  def create_session(capabilities, retry = true) : Session
    parameters = {capabilities: {alwaysMatch: capabilities}}
    data = command_handler.execute(:new_session, parameters: parameters)

    Session.new(http_client, command_handler, data.dig("value", "sessionId").as_s)
  rescue ex : Error
    if retry
      create_session(capabilities, retry: false)
    else
      raise ex
    end
  end

  def status : Status
    data = command_handler.execute(:status)

    Status.from_json(data["value"].to_json)
  end

  def stop
    service.try &.stop
  end
end

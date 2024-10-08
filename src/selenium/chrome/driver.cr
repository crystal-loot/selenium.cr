class Selenium::Chrome::Driver < Selenium::Driver
  def create_session(capabilities : Chrome::Capabilities) : Session
    super(capabilities)
  end

  private def command_handler
    Chrome::CommandHandler.new(@http_client)
  end

  def create_session(args : Array(String)) : Session
    capabilities = Chrome::Capabilities.new
    capabilities.chrome_options.args = args
    create_session(capabilities)
  end
end

class Selenium::Firefox::Driver < Selenium::Driver
  def create_session(capabilities : Firefox::Capabilities) : Session
    super(capabilities)
  end

  def create_session(args : Array(String)) : Session
    capabilities = Firefox::Capabilities.new
    capabilities.firefox_options.args = args
    create_session(capabilities)
  end
end

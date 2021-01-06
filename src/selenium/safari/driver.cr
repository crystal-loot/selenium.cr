class Selenium::Safari::Driver < Selenium::Driver
  def create_session(capabilities : Safari::Capabilities) : Session
    super(capabilities)
  end

  def create_session(args : Array(String)) : Session
    create_session(Safari::Capabilities.new)
  end
end

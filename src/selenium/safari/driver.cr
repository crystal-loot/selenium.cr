class Selenium::Safari::Driver < Selenium::Driver
  def create_session(capabilities : Safari::Capabilities) : Session
    super(capabilities)
  end
end

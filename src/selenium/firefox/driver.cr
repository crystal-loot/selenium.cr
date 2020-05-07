class Selenium::Firefox::Driver < Selenium::Driver
  def create_session(capabilities : Firefox::Capabilities) : Session
    super(capabilities)
  end
end

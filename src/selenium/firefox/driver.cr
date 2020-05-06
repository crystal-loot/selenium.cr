class Selenium::Firefox::Driver < Selenium::Remote::Driver
  def create_session(capabilities : Firefox::Capabilities) : Session
    super(capabilities)
  end
end

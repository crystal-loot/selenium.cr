class Selenium::Chrome::Driver < Selenium::Remote::Driver
  def create_session(capabilities : Chrome::Capabilities) : Session
    super(capabilities)
  end
end

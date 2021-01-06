class Selenium::Chrome::Capabilities < Selenium::Capabilities
  @browser_name = "chrome"

  @[JSON::Field(key: "goog:chromeOptions")]
  property chrome_options = ChromeOptions.new

  class ChromeOptions
    include JSON::Serializable

    def initialize
    end

    property args = [] of String

    property binary : String?

    property extensions : Array(String)?

    property detach : Bool?

    @[JSON::Field(key: "debuggerAddress")]
    property debugger_address : String?
  end
end

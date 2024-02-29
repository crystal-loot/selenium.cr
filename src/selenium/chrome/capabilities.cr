class Selenium::Chrome::Capabilities < Selenium::Capabilities
  @browser_name = "chrome"

  @[JSON::Field(key: "goog:chromeOptions")]
  property chrome_options = ChromeOptions.new

  # Enable logging
  #
  # ```
  # capabilities = Selenium::Chrome::Capabilities.new
  # capabilities.logging_prefs = {
  #   "browser"     => "ALL",
  #   "driver"      => "ALL",
  #   "performance" => "ALL",
  # }
  # ```
  @[JSON::Field(key: "goog:loggingPrefs")]
  property logging_prefs : Hash(String, String)?

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

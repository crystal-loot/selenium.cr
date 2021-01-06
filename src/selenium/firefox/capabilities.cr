class Selenium::Firefox::Capabilities < Selenium::Capabilities
  @browser_name = "firefox"

  @[JSON::Field(key: "moz:firefoxOptions")]
  property firefox_options = FirefoxOptions.new

  class FirefoxOptions
    include JSON::Serializable

    def initialize
    end

    property args = [] of String
  end
end

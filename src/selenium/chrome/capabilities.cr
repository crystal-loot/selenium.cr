class Selenium::Chrome::Capabilities < Selenium::Capabilities
  @[JSON::Field(key: "goog:chromeOptions")]
  property chrome_options = {"args" => [] of String}
  @browser_name = "chrome"

  def args(args)
    chrome_options["args"] = args
  end
end

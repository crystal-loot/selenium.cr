class Selenium::Firefox::Capabilities < Selenium::Capabilities
  @[JSON::Field(key: "moz:firefoxOptions")]
  property firefox_options = {"args" => [] of String}
  @browser_name = "firefox"

  def args(args)
    firefox_options["args"] = args
  end
end

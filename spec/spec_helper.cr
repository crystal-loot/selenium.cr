require "spec"
require "http"
require "../src/selenium"
require "./support/**"

server = TestServer.new(3002)

Spec.before_each do
  TestServer.reset
end

Spec.after_suite do
  server.close
end

spawn do
  server.listen
end

def browser
  ENV["SELENIUM_BROWSER"]? || "chrome"
end

def build_capabilities
  if browser == "chrome"
    capabilities = Selenium::Chrome::Capabilities.new
    capabilities.args(["no-sandbox", "headless", "disable-gpu"])
    capabilities
  elsif browser == "firefox"
    capabilities = Selenium::Firefox::Capabilities.new
    capabilities.args(["-headless"])
    capabilities
  else
    raise ArgumentError.new("unknown browser for running tests: #{browser}")
  end
end

def build_driver
  if browser == "chrome"
    Selenium::Driver.for(:chrome)
  elsif browser == "firefox"
    Selenium::Driver.for(:firefox, {base_url: "http://localhost:4444"})
  else
    raise ArgumentError.new("unknown browser for running tests: #{browser}")
  end
end

def with_session(driver = build_driver, capabilities = build_capabilities)
  session = driver.create_session(capabilities)
  yield(session)
ensure
  session.delete unless session.nil?
end

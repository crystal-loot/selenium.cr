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

def build_session
  if browser == "chrome"
    driver = Selenium::Driver.for(:chrome)
    capabilities = Selenium::Chrome::Capabilities.new
    capabilities.args(["no-sandbox", "headless", "disable-gpu"])
    driver.create_session(capabilities)
  elsif browser == "firefox"
    driver = Selenium::Driver.for(:firefox, {base_url: "http://localhost:4444"})
    capabilities = Selenium::Firefox::Capabilities.new
    capabilities.args(["-headless"])
    driver.create_session(capabilities)
  else
    raise ArgumentError.new("unknown browser for running tests: #{browser}")
  end
end

def with_session
  session = build_session
  yield(session)
ensure
  session.delete unless session.nil?
end

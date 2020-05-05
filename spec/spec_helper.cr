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

CHROME_HEADLESS = Selenium::Chrome::Capabilities.new
CHROME_HEADLESS.args(["--no-sandbox", "--headless", "--disable-gpu"])

def with_session(driver : Selenium::Driver, capabilities = CHROME_HEADLESS)
  session = driver.create_session(capabilities)
  yield(session)
ensure
  session.delete unless session.nil?
end

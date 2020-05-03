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

def with_session(driver : Selenium::Driver)
  session = driver.create_session
  yield(session)
ensure
  session.delete unless session.nil?
end

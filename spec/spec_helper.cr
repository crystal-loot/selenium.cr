require "spec"
require "http"
require "webdrivers"
require "../src/selenium"
require "./support/**"

class Global
  @@driver : Selenium::Driver?
  @@args : Array(String)?

  def self.set(@@driver, @@args)
  end

  def self.create_session
    @@driver.not_nil!.create_session(args: @@args.not_nil!)
  end

  def self.stop
    @@driver.not_nil!.stop
  end
end

driver, args = Selenium::TestDriverFactory.build(ENV["SELENIUM_BROWSER"]? || "chrome")
Global.set(driver, args)

server = TestServer.new(3002)

Spec.before_each do
  TestServer.reset
end

Spec.after_suite do
  server.close
  Global.stop
end

spawn do
  server.listen
end

def with_session
  session = Global.create_session
  yield(session)
ensure
  session.delete unless session.nil?
end

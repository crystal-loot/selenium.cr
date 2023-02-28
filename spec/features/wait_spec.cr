require "../spec_helper"

describe Selenium::Helpers::Wait do
  describe ".wait" do
    it "success if true" do
      TestServer.route "/home", <<-HTML
        <div id="div"></div>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")

        wait = Selenium::Helpers::Wait.new(timeout: 2.seconds, interval: 1.second)

        wait.until { session.find_element(:css, "#div") }
      end
    end

    it "raises an error if false" do
      TestServer.route "/home", <<-HTML
        <div id="div"></div>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")

        wait = Selenium::Helpers::Wait.new(timeout: 2.seconds, interval: 1.second)

        expect_raises(IO::TimeoutError, /timed out after 2 seconds \(no such element.*/) do
          wait.until { session.find_element(:css, "#div1") }
        end
      end
    end

    it "raises an error with custom message" do
      TestServer.route "/home", <<-HTML
        <div id="div"></div>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")

        wait = Selenium::Helpers::Wait.new(timeout: 2.seconds, interval: 1.second, message: "custom message")

        expect_raises(IO::TimeoutError, /custom message \(no such element.*/) do
          wait.until { session.find_element(:css, "#div1") }
        end
      end
    end
  end
end

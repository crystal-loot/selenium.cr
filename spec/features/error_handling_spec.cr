require "../spec_helper"

module Selenium::Command
  describe "error handling", tags: "feature" do
    it "raises exceptions when trying to find element that does not exist" do
      TestServer.route "/home", "<h1>The Title</h1>"
      driver = Driver.for(:chrome)

      with_session(driver) do |session|
        session.navigate_to("http://localhost:3002/home")

        expected_message = "no such element: Unable to locate element: {\"method\":\"css selector\",\"selector\":\"#missing-element\"}"
        expect_raises(Error, expected_message) do
          session.find_element(:css, "#missing-element")
        end
      end
    end

    it "raises exceptions when trying to find element within element that no longer exists" do
      TestServer.route "/home", "<div id=\"parent\"><a href=\"/about\">Click</a></div>"
      TestServer.route "/about", "<h1>The Title</h1>"
      driver = Driver.for(:chrome)

      with_session(driver) do |session|
        session.navigate_to("http://localhost:3002/home")
        parent_element = session.find_element(:css, "#parent")
        child_element = parent_element.find_child_element(:link_text, "Click")
        child_element.click

        expected_message = "stale element reference: element is not attached to the page document"
        expect_raises(Error, expected_message) do
          parent_element.find_child_element(:link_text, "Click")
        end
      end
    end

    it "raises exception when making get command" do
      TestServer.route "/home", "<h1 id=\"title\">Title</h1>"
      driver = Driver.for(:chrome)

      with_session(driver) do |session|
        session.navigate_to("http://localhost:3002/home")

        expected_message = "stale element reference: element is not attached to the page document"
        expect_raises(Error, expected_message) do
          Element.new(session.command_handler, session.id, ElementId.random).property("id")
        end
      end
    end

    it "raises exception when making delete command" do
      driver = Driver.for(:chrome)
      command_handler = CommandHandler.new(driver.http_client)

      expect_raises(Error, "invalid session id") do
        Session.new(driver.http_client, command_handler, "invalidsessionid").window_manager.close_window
      end
    end
  end
end

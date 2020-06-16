require "../spec_helper"

module Selenium::Command
  describe "error handling", tags: "feature" do
    it "raises exceptions when trying to find element that does not exist" do
      TestServer.route "/home", "<h1>The Title</h1>"

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")

        expect_raises(Error) do
          session.find_element(:css, "#missing-element")
        end
      end
    end

    it "raises exceptions when trying to find element within element that no longer exists", tags: "safari" do
      TestServer.route "/home", "<div id=\"parent\"><a href=\"/about\">Click</a></div>"
      TestServer.route "/about", "<h1>The Title</h1>"

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        parent_element = session.find_element(:css, "#parent")
        child_element = parent_element.find_child_element(:link_text, "Click")
        child_element.click

        expect_raises(Error) do
          parent_element.find_child_element(:link_text, "Click")
        end
      end
    end

    it "can raise exception when accessing unknown element" do
      TestServer.route "/home", "<h1 id=\"title\">Title</h1>"

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")

        expect_raises(Error) do
          Element.new(session.command_handler, session.id, "unknown-element-id").property("id")
        end
      end
    end

    it "raises exception when making delete command" do
      with_session do |session|
        expect_raises(Error, /session id/) do
          Session.new(session.http_client, session.command_handler, "invalidsessionid").window_manager.close_window
        end
      end
    end
  end
end

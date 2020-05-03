require "../spec_helper"

module Selenium::Command
  describe "error handling", tags: "feature" do
    it "raises exceptions when trying to find element that does not exist" do
      TestServer.route "/home", "<h1>The Title</h1>"
      driver = HttpDriver.new

      with_session(driver) do |session_id|
        NavigateTo.new(driver, session_id).execute("localhost:3002/home")
        command = FindElement.new(driver, session_id)

        expected_message = "no such element: Unable to locate element: {\"method\":\"css selector\",\"selector\":\"#missing-element\"}"
        expect_raises(Error, expected_message) do
          command.execute(using: LocationStrategy::CSS, value: "#missing-element")
        end
      end
    end

    it "raises exceptions when trying to find element within element that no longer exists" do
      TestServer.route "/home", "<div id=\"parent\"><a href=\"/about\">Click</a></div>"
      TestServer.route "/about", "<h1>The Title</h1>"
      driver = HttpDriver.new

      with_session(driver) do |session_id|
        NavigateTo.new(driver, session_id).execute("localhost:3002/home")
        parent_element_id = FindElement.new(driver, session_id).execute(LocationStrategy::CSS, "#parent")
        anchor_id = FindElement.new(driver, session_id).execute(LocationStrategy::LINK_TEXT, "Click")
        ElementClick.new(driver, session_id).execute(anchor_id)

        expected_message = "stale element reference: element is not attached to the page document"
        expect_raises(Error, expected_message) do
          FindElementFromElement.new(driver, session_id, parent_element_id).execute(LocationStrategy::LINK_TEXT, "Click")
        end
      end
    end

    it "raises exceptions when trying to find element within element that no longer exists" do
      TestServer.route "/home", "<div id=\"parent\"><a href=\"/about\">Click</a></div>"
      TestServer.route "/about", "<h1>The Title</h1>"
      driver = HttpDriver.new

      with_session(driver) do |session_id|
        NavigateTo.new(driver, session_id).execute("localhost:3002/home")
        parent_element_id = FindElement.new(driver, session_id).execute(LocationStrategy::CSS, "#parent")
        anchor_id = FindElement.new(driver, session_id).execute(LocationStrategy::LINK_TEXT, "Click")
        ElementClick.new(driver, session_id).execute(anchor_id)

        expected_message = "stale element reference: element is not attached to the page document"
        expect_raises(Error, expected_message) do
          FindElementFromElement.new(driver, session_id, parent_element_id)
            .execute(LocationStrategy::LINK_TEXT, "Click")
        end
      end
    end

    it "raises exception when making get command" do
      TestServer.route "/home", "<h1 id=\"title\">Title</h1>"
      driver = HttpDriver.new

      with_session(driver) do |session_id|
        NavigateTo.new(driver, session_id).execute("localhost:3002/home")

        expected_message = "stale element reference: element is not attached to the page document"
        expect_raises(Error, expected_message) do
          invalid_element_id = ElementId.random
          GetElementProperty.new(driver, session_id).execute(invalid_element_id, "id")
        end
      end
    end

    it "raises exception when making delete command" do
      driver = HttpDriver.new

      expect_raises(Error, "invalid session id") do
        CloseWindow.new(driver, "invalidsessionid").execute
      end
    end
  end
end

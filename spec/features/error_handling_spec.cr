require "../spec_helper"

module Selenium::Command
  describe "error handling", tags: "feature" do
    it "raises exceptions when trying to find element that does not exist" do
      TestServer.route "/home", "<h1>The Title</h1>"
      driver = Driver.new
      http_client = driver.http_client

      with_session(driver) do |session|
        session_id = session.id
        NavigateTo.new(http_client, session_id).execute("localhost:3002/home")
        command = FindElement.new(http_client, session_id)

        expected_message = "no such element: Unable to locate element: {\"method\":\"css selector\",\"selector\":\"#missing-element\"}"
        expect_raises(Error, expected_message) do
          command.execute(using: LocationStrategy::CSS, value: "#missing-element")
        end
      end
    end

    it "raises exceptions when trying to find element within element that no longer exists" do
      TestServer.route "/home", "<div id=\"parent\"><a href=\"/about\">Click</a></div>"
      TestServer.route "/about", "<h1>The Title</h1>"
      driver = Driver.new
      http_client = driver.http_client

      with_session(driver) do |session|
        session_id = session.id
        NavigateTo.new(http_client, session_id).execute("localhost:3002/home")
        parent_element_id = FindElement.new(http_client, session_id).execute(LocationStrategy::CSS, "#parent")
        anchor_id = FindElement.new(http_client, session_id).execute(LocationStrategy::LINK_TEXT, "Click")
        ElementClick.new(http_client, session_id).execute(anchor_id)

        expected_message = "stale element reference: element is not attached to the page document"
        expect_raises(Error, expected_message) do
          FindElementFromElement.new(http_client, session_id, parent_element_id).execute(LocationStrategy::LINK_TEXT, "Click")
        end
      end
    end

    it "raises exceptions when trying to find element within element that no longer exists" do
      TestServer.route "/home", "<div id=\"parent\"><a href=\"/about\">Click</a></div>"
      TestServer.route "/about", "<h1>The Title</h1>"
      driver = Driver.new
      http_client = driver.http_client

      with_session(driver) do |session|
        session_id = session.id
        NavigateTo.new(http_client, session_id).execute("localhost:3002/home")
        parent_element_id = FindElement.new(http_client, session_id).execute(LocationStrategy::CSS, "#parent")
        anchor_id = FindElement.new(http_client, session_id).execute(LocationStrategy::LINK_TEXT, "Click")
        ElementClick.new(http_client, session_id).execute(anchor_id)

        expected_message = "stale element reference: element is not attached to the page document"
        expect_raises(Error, expected_message) do
          FindElementFromElement.new(http_client, session_id, parent_element_id)
            .execute(LocationStrategy::LINK_TEXT, "Click")
        end
      end
    end

    it "raises exception when making get command" do
      TestServer.route "/home", "<h1 id=\"title\">Title</h1>"
      driver = Driver.new
      http_client = driver.http_client

      with_session(driver) do |session|
        session_id = session.id
        NavigateTo.new(http_client, session_id).execute("localhost:3002/home")

        expected_message = "stale element reference: element is not attached to the page document"
        expect_raises(Error, expected_message) do
          invalid_element_id = ElementId.random
          GetElementProperty.new(http_client, session_id).execute(invalid_element_id, "id")
        end
      end
    end

    it "raises exception when making delete command" do
      driver = Driver.new
      http_client = driver.http_client

      expect_raises(Error, "invalid session id") do
        CloseWindow.new(http_client, "invalidsessionid").execute
      end
    end
  end
end

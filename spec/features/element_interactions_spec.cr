require "../spec_helper"

module Selenium::Command
  describe "element interactions", tags: "feature" do
    it "can click" do
      TestServer.route "/next-page", "<h1>You made it!</h1>"
      TestServer.route "/home", <<-HTML
        <a href="/next-page">Click Me!</a>
      HTML
      http_client = HttpClient.new

      with_session(http_client) do |session_id|
        NavigateTo.new(http_client, session_id).execute("localhost:3002/home")
        element_id = FindElement.new(http_client, session_id)
          .execute(using: LocationStrategy::LINK_TEXT, value: "Click Me!")
        ElementClick.new(http_client, session_id).execute(element_id)

        current_url = GetCurrentUrl.new(http_client, session_id).execute

        current_url.should eq("http://localhost:3002/next-page")
      end
    end

    it "can clear" do
      TestServer.route "/home", <<-HTML
        <input type="text" id="name" value="John">
      HTML
      http_client = HttpClient.new

      with_session(http_client) do |session_id|
        NavigateTo.new(http_client, session_id).execute("localhost:3002/home")
        element_id = FindElement.new(http_client, session_id).execute(using: LocationStrategy::CSS, value: "#name")
        ElementClear.new(http_client, session_id).execute(element_id)
        value = GetElementAttribute.new(http_client, session_id).execute(element_id, "value")
        value.should be_empty
      end
    end

    it "can send keys" do
      TestServer.route "/home", <<-HTML
        <input type="text" id="name" value="">
      HTML
      http_client = HttpClient.new

      with_session(http_client) do |session_id|
        NavigateTo.new(http_client, session_id).execute("localhost:3002/home")
        element_id = FindElement.new(http_client, session_id).execute(using: LocationStrategy::CSS, value: "#name")
        ElementClear.new(http_client, session_id).execute(element_id)
        ElementSendKeys.new(http_client, session_id).execute(element_id, ["Jenny", :space, "Smith"])
        value = GetElementAttribute.new(http_client, session_id).execute(element_id, "value")
        value.should eq("Jenny Smith")
      end
    end
  end
end

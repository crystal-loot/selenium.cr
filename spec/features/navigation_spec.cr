require "../spec_helper"

module Selenium::Command
  describe "navigation", tags: "feature" do
    it "works" do
      TestServer.route "/home", "<h1>Home</h1>"
      TestServer.route "/about", <<-HTML
      <head>
        <title>Test: About</title>
      </head>
      <h1>About</h1>
      HTML
      driver = Driver.new
      http_client = driver.http_client

      with_session(driver) do |session|
        session_id = session.id
        NavigateTo.new(http_client, session_id).execute("localhost:3002/home")
        NavigateTo.new(http_client, session_id).execute("localhost:3002/about")
        GoBack.new(http_client, session_id).execute
        current_url = GetCurrentUrl.new(http_client, session_id).execute
        current_url.should eq("http://localhost:3002/home")

        GoForward.new(http_client, session_id).execute
        current_url = GetCurrentUrl.new(http_client, session_id).execute
        current_url.should eq("http://localhost:3002/about")

        Refresh.new(http_client, session_id).execute
        current_url = GetCurrentUrl.new(http_client, session_id).execute
        current_url.should eq("http://localhost:3002/about")

        title = GetTitle.new(http_client, session_id).execute
        title.should eq("Test: About")
      end
    end
  end
end

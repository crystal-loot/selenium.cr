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
      driver = HttpDriver.new

      with_session(driver) do |session_id|
        NavigateTo.new(driver, session_id).execute("localhost:3002/home")
        NavigateTo.new(driver, session_id).execute("localhost:3002/about")
        GoBack.new(driver, session_id).execute
        current_url = GetCurrentUrl.new(driver, session_id).execute
        current_url.should eq("http://localhost:3002/home")

        GoForward.new(driver, session_id).execute
        current_url = GetCurrentUrl.new(driver, session_id).execute
        current_url.should eq("http://localhost:3002/about")

        Refresh.new(driver, session_id).execute
        current_url = GetCurrentUrl.new(driver, session_id).execute
        current_url.should eq("http://localhost:3002/about")

        title = GetTitle.new(driver, session_id).execute
        title.should eq("Test: About")
      end
    end
  end
end

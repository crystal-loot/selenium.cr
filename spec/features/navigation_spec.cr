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

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        session.navigate_to("http://localhost:3002/about")
        navigation_manager = session.navigation_manager
        navigation_manager.go_back
        session.current_url.should eq("http://localhost:3002/home")

        navigation_manager.go_forward
        session.current_url.should eq("http://localhost:3002/about")

        navigation_manager.refresh
        session.current_url.should eq("http://localhost:3002/about")

        session.title.should eq("Test: About")
      end
    end
  end
end

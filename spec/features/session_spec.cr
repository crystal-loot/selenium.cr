require "../spec_helper"

module Selenium::Command
  describe "session", tags: "feature" do
    it "run multiple browsers on separate process" do
      TestServer.route "/home", "<h1>The Title</h1>"
      TestServer.route "/next-page", "<h1>You made it!</h1>"
      TestServer.route "/action-page", <<-HTML
        <a href="/next-page">Click Me!</a>
      HTML

      begin
        driver1, args1 = Selenium::TestDriverFactory.build(ENV["SELENIUM_BROWSER"]? || "chrome")
        session1 = driver1.not_nil!.create_session(args: args1.not_nil!)
        driver2, args2 = Selenium::TestDriverFactory.build(ENV["SELENIUM_BROWSER"]? || "chrome")
        session2 = driver2.not_nil!.create_session(args: args2.not_nil!)

        session1.navigate_to("http://localhost:3002/home")
        session2.navigate_to("http://localhost:3002/action-page")
        element = session2.find_element(:link_text, "Click Me!")
        element.click
        session1.current_url.should eq("http://localhost:3002/home")
        session2.current_url.should eq("http://localhost:3002/next-page")
      ensure
        session1.try &.delete
        driver1.try &.stop
        session2.try &.delete
        driver2.try &.stop
        TestServer.reset
      end
    end
  end
end

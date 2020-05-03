require "../spec_helper"

module Selenium::Command
  describe "element interactions", tags: "feature" do
    it "can clicks" do
      TestServer.route "/next-page", "<h1>You made it!</h1>"
      TestServer.route "/home", <<-HTML
        <a href="/next-page">Click Me!</a>
      HTML
      driver = HttpDriver.new

      with_session(driver) do |session_id|
        NavigateTo.new(driver, session_id).execute("localhost:3002/home")
        element_id = FindElement.new(driver, session_id)
          .execute(using: LocationStrategy::LINK_TEXT, value: "Click Me!")
        ElementClick.new(driver, session_id).execute(element_id)

        current_url = GetCurrentUrl.new(driver, session_id).execute

        current_url.should eq("http://localhost:3002/next-page")
      end
    end
  end
end

require "../spec_helper"

module Selenium::Command
  describe "elements", tags: "feature", focus: true do
    it "can be targeted individually" do
      driver = HttpDriver.new
      TestServer.route "/home", "<span id='heading'>Home</span>"

      session_id = NewSession.new(driver).execute
      NavigateTo.new(driver, session_id).execute("localhost:3002/home")
      element_id = FindElement.new(driver, session_id).execute(using: LocationStrategy::CSS, value: "#heading")

      DeleteSession.new(driver, session_id).execute
    end
  end
end

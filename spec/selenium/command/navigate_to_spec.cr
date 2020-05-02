require "../../spec_helper"

module Selenium::Command
  describe NavigateTo do
    it "works" do
      driver = TestDriver.new
      session_id = SessionId.random
      command = NavigateTo.new(driver, session_id)

      command.execute("https://example.com")

      driver.request_path.should eq("/session/#{session_id}/url")
      driver.parsed_request_body["url"].should eq("https://example.com")
    end
  end
end

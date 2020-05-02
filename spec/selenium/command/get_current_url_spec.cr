require "../../spec_helper"

module Selenium::Command
  describe GetCurrentUrl do
    it "works" do
      driver = TestDriver.new
      driver.response_body = {url: "https://example.com"}.to_json
      session_id = SessionId.random
      command = GetCurrentUrl.new(driver, session_id)

      command.execute.should eq("https://example.com")
      driver.request_path.should eq("/session/#{session_id}/url")
    end
  end
end

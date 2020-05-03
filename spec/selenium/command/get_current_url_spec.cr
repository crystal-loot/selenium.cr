require "../../spec_helper"

module Selenium::Command
  describe GetCurrentUrl do
    it "works" do
      driver = TestDriver.new
      driver.response_value("https://example.com")
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetCurrentUrl.new(driver, session_id)

      command.execute.should eq("https://example.com")
      driver.request_path.should eq("/session/#{session_id}/url")
    end
  end
end

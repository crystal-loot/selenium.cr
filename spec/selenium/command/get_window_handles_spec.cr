require "../../spec_helper"

module Selenium::Command
  describe GetWindowHandles do
    it "works" do
      driver = TestDriver.new
      driver.response_body = {handles: ["Window 1", "Window 2"]}.to_json
      session_id = SessionId.random
      command = GetWindowHandles.new(driver, session_id)

      command.execute.should eq(["Window 1", "Window 2"])
      driver.request_path.should eq("/session/#{session_id}/window/handles")
    end
  end
end

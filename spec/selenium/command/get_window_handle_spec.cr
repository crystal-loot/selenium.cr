require "../../spec_helper"

module Selenium::Command
  describe GetWindowHandle do
    it "works" do
      driver = TestDriver.new
      driver.response_body = {identifier: "Window 1"}.to_json
      session_id = SessionId.random
      command = GetWindowHandle.new(driver, session_id)

      command.execute.should eq("Window 1")
      driver.request_path.should eq("/session/#{session_id}/window")
    end
  end
end

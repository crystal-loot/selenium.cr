require "../../spec_helper"

module Selenium::Command
  describe SwitchToParentFrame do
    it "works" do
      driver = TestDriver.new
      session_id = SessionId.random
      command = SwitchToParentFrame.new(driver, session_id)

      command.execute

      driver.request_path.should eq("/session/#{session_id}/frame/parent")
    end
  end
end

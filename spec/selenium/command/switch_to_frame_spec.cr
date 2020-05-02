require "../../spec_helper"

module Selenium::Command
  describe SwitchToFrame do
    it "works" do
      driver = TestDriver.new
      session_id = SessionId.random
      command = SwitchToFrame.new(driver, session_id)

      command.execute(123)

      driver.request_path.should eq("/session/#{session_id}/frame")
      driver.request_body.should eq({id: 123}.to_json)
    end
  end
end

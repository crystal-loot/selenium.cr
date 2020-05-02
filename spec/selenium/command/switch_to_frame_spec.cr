require "../../spec_helper"

module Selenium::Command
  describe SwitchToFrame do
    it "works" do
      driver = TestDriver.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = SwitchToFrame.new(driver, session_id)

      command.execute(123)

      driver.request_path.should eq("/session/#{session_id}/frame")
      driver.request_body.should eq({id: 123}.to_json)
    end
  end
end

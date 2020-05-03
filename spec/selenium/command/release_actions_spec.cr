require "../../spec_helper"

module Selenium::Command
  describe ReleaseActions do
    it "works" do
      driver = TestDriver.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = ReleaseActions.new(driver, session_id)

      command.execute

      driver.request_path.should eq("/session/#{session_id}/actions")
    end
  end
end

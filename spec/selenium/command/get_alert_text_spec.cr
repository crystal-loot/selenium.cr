require "../../spec_helper"

module Selenium::Command
  describe GetAlertText do
    it "works" do
      driver = TestDriver.new
      driver.response_value("HEY THERE!")
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetAlertText.new(driver, session_id)

      command.execute.should eq("HEY THERE!")
      driver.request_path.should eq("/session/#{session_id}/alert/text")
    end
  end
end

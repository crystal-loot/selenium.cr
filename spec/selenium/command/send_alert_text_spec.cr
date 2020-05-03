require "../../spec_helper"

module Selenium::Command
  describe SendAlertText do
    it "works" do
      driver = TestDriver.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = SendAlertText.new(driver, session_id)

      command.execute("HEY THERE!")

      driver.request_path.should eq("/session/#{session_id}/alert/text")
      driver.request_body.should eq({
        text: "HEY THERE!",
      }.to_json)
    end
  end
end

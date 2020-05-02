require "../../spec_helper"

module Selenium::Command
  describe SwitchToWindow do
    it "works" do
      driver = TestDriver.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = SwitchToWindow.new(driver, session_id)

      command.execute("abc")

      driver.request_path.should eq("/session/#{session_id}/window")
      driver.request_body.should eq({handle: "abc"}.to_json)
    end
  end
end

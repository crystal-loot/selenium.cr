require "../../spec_helper"

module Selenium::Command
  describe GetWindowRect do
    it "works" do
      driver = TestDriver.new
      driver.response_value({
        x:      100,
        y:      120,
        width:  400,
        height: 660,
      })
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetWindowRect.new(driver, session_id)

      result = command.execute

      driver.request_path.should eq("/session/#{session_id}/window/rect")
      result.x.should eq(100)
      result.y.should eq(120)
      result.width.should eq(400)
      result.height.should eq(660)
    end
  end
end

require "../../spec_helper"

module Selenium::Command
  describe GetWindowHandles do
    it "works" do
      driver = TestDriver.new
      driver.response_value({
        handles: ["Window 1", "Window 2"],
      })
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetWindowHandles.new(driver, session_id)

      command.execute.should eq(["Window 1", "Window 2"])
      driver.request_path.should eq("/session/#{session_id}/window/handles")
    end
  end
end

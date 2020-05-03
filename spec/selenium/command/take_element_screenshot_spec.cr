require "../../spec_helper"

module Selenium::Command
  describe TakeElementScreenshot do
    it "works" do
      driver = TestDriver.new
      driver.response_value("data-encoded-string-screenshot")
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      element_id = ElementId.random
      command = TakeElementScreenshot.new(driver, session_id, element_id)

      command.execute.should eq("data-encoded-string-screenshot")
      driver.request_path.should eq("/session/#{session_id}/element/#{element_id}/screenshot")
    end
  end
end

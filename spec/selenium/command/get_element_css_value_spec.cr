require "../../spec_helper"

module Selenium::Command
  describe GetElementCssValue do
    it "works" do
      driver = TestDriver.new
      driver.response_value("100px")
      element_id = ElementId.random
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetElementCssValue.new(driver, session_id)

      result = command.execute(element_id, "width")

      driver.request_path.should eq("/session/#{session_id}/element/#{element_id}/css/width")
      result.should eq("100px")
    end
  end
end

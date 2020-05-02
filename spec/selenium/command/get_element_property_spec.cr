require "../../spec_helper"

module Selenium::Command
  describe GetElementProperty do
    it "works" do
      driver = TestDriver.new
      driver.response_value("fake-element-value")
      element_id = ElementId.random
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetElementProperty.new(driver, session_id)

      result = command.execute(element_id, "value")

      driver.request_path.should eq("/session/#{session_id}/element/#{element_id}/property/value")
      result.should eq("fake-element-value")
    end
  end
end

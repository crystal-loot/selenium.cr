require "../../spec_helper"

module Selenium::Command
  describe GetElementTagName do
    it "works" do
      driver = TestDriver.new
      driver.response_value("h1")
      element_id = ElementId.random
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetElementTagName.new(driver, session_id)

      result = command.execute(element_id)

      driver.request_path.should eq("/session/#{session_id}/element/#{element_id}/name")
      result.should eq("h1")
    end
  end
end

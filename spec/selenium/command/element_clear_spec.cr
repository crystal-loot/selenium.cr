require "../../spec_helper"

module Selenium::Command
  describe ElementClear do
    it "works" do
      driver = TestDriver.new
      element_id = ElementId.random
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = ElementClear.new(driver, session_id)

      result = command.execute(element_id)

      driver.request_path.should eq("/session/#{session_id}/element/#{element_id}/clear")
    end
  end
end

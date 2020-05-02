require "../../spec_helper"

module Selenium::Command
  describe ElementSendKeys do
    it "works" do
      driver = TestDriver.new
      element_id = ElementId.random
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = ElementSendKeys.new(driver, session_id)

      result = command.execute(element_id, ["hi!"])

      driver.request_path.should eq("/session/#{session_id}/element/#{element_id}/value")
      driver.request_body.should eq({value: ["hi!"]}.to_json)
    end
  end
end

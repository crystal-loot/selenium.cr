require "../../spec_helper"

module Selenium::Command
  describe GetActiveElement do
    it "works" do
      driver = TestDriver.new
      element_id = ElementId.random
      driver.response_body = { "element-1" => element_id }.to_json
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetActiveElement.new(driver, session_id)

      result = command.execute

      driver.request_path.should eq("/session/#{session_id}/element/active")
      result.should eq(element_id)
    end
  end
end

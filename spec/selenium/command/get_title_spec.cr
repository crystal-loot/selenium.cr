require "../../spec_helper"

module Selenium::Command
  describe GetTitle do
    it "works" do
      driver = TestDriver.new
      driver.response_value({title: "Foo"})
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetTitle.new(driver, session_id)

      command.execute.should eq("Foo")
      driver.request_path.should eq("/session/#{session_id}/title")
    end
  end
end

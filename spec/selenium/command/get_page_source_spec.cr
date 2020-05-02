require "../../spec_helper"

module Selenium::Command
  describe GetPageSource do
    it "works" do
      driver = TestDriver.new
      driver.response_value("<h1>Hey</h1>")
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetPageSource.new(driver, session_id)

      result = command.execute

      driver.request_path.should eq("/session/#{session_id}/source")
      result.should eq("<h1>Hey</h1>")
    end
  end
end

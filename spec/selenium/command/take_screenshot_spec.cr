require "../../spec_helper"

module Selenium::Command
  describe TakeScreenshot do
    it "works" do
      driver = TestDriver.new
      encoded_response = Base64.encode("data-encoded-string-screenshot")
      driver.response_value(encoded_response)
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = TakeScreenshot.new(driver, session_id)

      command.execute.should eq(Base64.decode(encoded_response))
      driver.request_path.should eq("/session/#{session_id}/screenshot")
    end
  end
end

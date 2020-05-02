require "../../spec_helper"

module Selenium::Command
  describe DeleteCookie do
    it "works" do
      driver = TestDriver.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = DeleteCookie.new(driver, session_id)

      command.execute("fizz")

      driver.request_path.should eq("/session/#{session_id}/cookie/fizz")
    end
  end
end

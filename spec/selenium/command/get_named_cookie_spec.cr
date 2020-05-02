require "../../spec_helper"

module Selenium::Command
  describe GetNamedCookie do
    it "works" do
      driver = TestDriver.new
      cookie = Cookie.new(name: "fizz", value: "buzz")
      driver.response_value(cookie)
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetNamedCookie.new(driver, session_id)

      result = command.execute("fizz")

      driver.request_path.should eq("/session/#{session_id}/cookie/fizz")
      result.should eq(cookie)
    end
  end
end

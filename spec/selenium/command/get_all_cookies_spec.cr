require "../../spec_helper"

module Selenium::Command
  describe GetAllCookies do
    it "works" do
      driver = TestDriver.new
      cookie_a = Cookie.new(name: "foo", value: "bar", http_only: true)
      cookie_b = Cookie.new(name: "fizz", value: "buzz")
      driver.response_value([cookie_a, cookie_b])
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetAllCookies.new(driver, session_id)

      results = command.execute

      driver.request_path.should eq("/session/#{session_id}/cookie")
      results.size.should eq(2)
      results.should contain(cookie_a)
      results.should contain(cookie_b)
    end
  end
end

require "../../spec_helper"

module Selenium::Command
  describe AddCookie do
    it "works" do
      driver = TestDriver.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = AddCookie.new(driver, session_id)
      cookie = Cookie.new(name: "foo", value: "bar", http_only: true)

      command.execute(cookie)

      driver.request_path.should eq("/session/#{session_id}/cookie")
      driver.request_body.should eq({
        cookie: {
          name:     "foo",
          value:    "bar",
          httpOnly: true,
        },
      }.to_json)
    end
  end
end

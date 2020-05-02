require "../../spec_helper"

module Selenium::Command
  describe FindElement do
    it "works" do
      driver = TestDriver.new
      driver.response_body = [
        {
          id: "abc",
        },
      ].to_json
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = FindElement.new(driver, session_id)

      result = command.execute(using: LocationStrategy::LINK_TEXT, value: "foo")

      driver.request_path.should eq("/session/#{session_id}/element")
      driver.request_body.should eq({
        using: "link text",
        value: "foo",
      }.to_json)
      result.size.should eq(1)
      result.first.id.should eq("abc")
    end
  end
end

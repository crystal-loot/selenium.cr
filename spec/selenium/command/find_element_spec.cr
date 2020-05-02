require "../../spec_helper"

module Selenium::Command
  describe FindElement do
    it "works" do
      driver = TestDriver.new
      driver.response_body = {
        "element-6066-11e4-a52e-4f735466cecf" => "bec4cae4-4468-470d-9bea-8b516c2fa2c5"
      }.to_json
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = FindElement.new(driver, session_id)

      result = command.execute(using: LocationStrategy::LINK_TEXT, value: "foo")

      driver.request_path.should eq("/session/#{session_id}/element")
      driver.request_body.should eq({
        using: "link text",
        value: "foo",
      }.to_json)
      result.should eq("bec4cae4-4468-470d-9bea-8b516c2fa2c5")
    end
  end
end

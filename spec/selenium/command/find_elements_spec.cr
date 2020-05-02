require "../../spec_helper"

module Selenium::Command
  describe FindElements do
    it "works" do
      driver = TestDriver.new
      element_id_a = UUID.random
      element_id_b = UUID.random
      driver.response_body = [
        {"element-1" => element_id_a},
        {"element-2" => element_id_b}
      ].to_json
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = FindElements.new(driver, session_id)

      results = command.execute(using: LocationStrategy::LINK_TEXT, value: "foo")

      driver.request_path.should eq("/session/#{session_id}/elements")
      driver.request_body.should eq({
        using: "link text",
        value: "foo",
      }.to_json)
      results.size.should eq(2)
      results[0].should eq(element_id_a)
      results[1].should eq(element_id_b)
    end
  end
end

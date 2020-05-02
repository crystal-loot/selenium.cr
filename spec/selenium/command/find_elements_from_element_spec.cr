require "../../spec_helper"

module Selenium::Command
  describe FindElementsFromElement do
    it "works" do
      driver = TestDriver.new
      parent_element_id = ElementId.random
      element_id_a = ElementId.random
      element_id_b = ElementId.random
      driver.response_value([
        {"element-1" => element_id_a},
        {"element-2" => element_id_b}
      ])
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = FindElementsFromElement.new(driver, session_id, parent_element_id)

      results = command.execute(using: LocationStrategy::LINK_TEXT, value: "foo")

      driver.request_path.should eq("/session/#{session_id}/element/#{parent_element_id}/elements")
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

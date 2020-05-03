require "../../spec_helper"

module Selenium::Command
  describe FindElementsFromElement do
    it "works" do
      http_client = TestHttpClient.new
      parent_element_id = ElementId.random
      element_id_a = ElementId.random
      element_id_b = ElementId.random
      http_client.response_value([
        {"element-1" => element_id_a},
        {"element-2" => element_id_b},
      ])
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = FindElementsFromElement.new(http_client, session_id, parent_element_id)

      results = command.execute(using: LocationStrategy::LINK_TEXT, value: "foo")

      http_client.request_path.should eq("/session/#{session_id}/element/#{parent_element_id}/elements")
      http_client.request_body.should eq({
        using: "link text",
        value: "foo",
      }.to_json)
      results.size.should eq(2)
      results[0].should eq(element_id_a)
      results[1].should eq(element_id_b)
    end
  end
end

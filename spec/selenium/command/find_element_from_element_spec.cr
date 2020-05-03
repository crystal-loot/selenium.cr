require "../../spec_helper"

module Selenium::Command
  describe FindElementFromElement do
    it "works" do
      http_client = TestHttpClient.new
      parent_element_id = ElementId.random
      element_id = ElementId.random
      http_client.response_value({"element-1" => element_id})
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = FindElementFromElement.new(http_client, session_id, parent_element_id)

      result = command.execute(using: LocationStrategy::LINK_TEXT, value: "foo")

      http_client.request_path.should eq("/session/#{session_id}/element/#{parent_element_id}/element")
      http_client.request_body.should eq({
        using: "link text",
        value: "foo",
      }.to_json)
      result.should eq(element_id)
    end
  end
end

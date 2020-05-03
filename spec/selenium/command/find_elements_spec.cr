require "../../spec_helper"

module Selenium::Command
  describe FindElements do
    it "works" do
      http_client = TestHttpClient.new
      element_id_a = UUID.random
      element_id_b = UUID.random
      http_client.response_value([
        {"element-1" => element_id_a},
        {"element-2" => element_id_b},
      ])
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = FindElements.new(http_client, session_id)

      results = command.execute(using: LocationStrategy::LINK_TEXT, value: "foo")

      http_client.request_path.should eq("/session/#{session_id}/elements")
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

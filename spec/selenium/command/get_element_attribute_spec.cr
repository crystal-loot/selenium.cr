require "../../spec_helper"

module Selenium::Command
  describe GetElementAttribute do
    it "works" do
      http_client = TestHttpClient.new
      http_client.response_value("fake-element-value")
      element_id = ElementId.random
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetElementAttribute.new(http_client, session_id)

      result = command.execute(element_id, "value")

      http_client.request_path.should eq("/session/#{session_id}/element/#{element_id}/attribute/value")
      result.should eq("fake-element-value")
    end
  end
end

require "../../spec_helper"

module Selenium::Command
  describe ElementClick do
    it "works" do
      http_client = TestHttpClient.new
      element_id = ElementId.random
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = ElementClick.new(http_client, session_id)

      result = command.execute(element_id)

      http_client.request_path.should eq("/session/#{session_id}/element/#{element_id}/click")
    end
  end
end

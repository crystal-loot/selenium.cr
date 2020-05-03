require "../../spec_helper"

module Selenium::Command
  describe GetTitle do
    it "works" do
      http_client = TestHttpClient.new
      http_client.response_value("Foo")
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetTitle.new(http_client, session_id)

      command.execute.should eq("Foo")
      http_client.request_path.should eq("/session/#{session_id}/title")
    end
  end
end

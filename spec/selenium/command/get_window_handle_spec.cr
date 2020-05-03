require "../../spec_helper"

module Selenium::Command
  describe GetWindowHandle do
    it "works" do
      http_client = TestHttpClient.new
      http_client.response_value("Window 1")
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetWindowHandle.new(http_client, session_id)

      command.execute.should eq("Window 1")
      http_client.request_path.should eq("/session/#{session_id}/window")
    end
  end
end

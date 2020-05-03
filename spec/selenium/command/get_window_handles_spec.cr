require "../../spec_helper"

module Selenium::Command
  describe GetWindowHandles do
    it "works" do
      http_client = TestHttpClient.new
      http_client.response_value(["Window 1", "Window 2"])
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetWindowHandles.new(http_client, session_id)

      command.execute.should eq(["Window 1", "Window 2"])
      http_client.request_path.should eq("/session/#{session_id}/window/handles")
    end
  end
end

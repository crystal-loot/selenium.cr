require "../../spec_helper"

module Selenium::Command
  describe SwitchToFrame do
    it "works" do
      http_client = TestHttpClient.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = SwitchToFrame.new(http_client, session_id)

      command.execute(123)

      http_client.request_path.should eq("/session/#{session_id}/frame")
      http_client.request_body.should eq({id: 123}.to_json)
    end
  end
end

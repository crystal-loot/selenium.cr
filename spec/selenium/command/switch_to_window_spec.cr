require "../../spec_helper"

module Selenium::Command
  describe SwitchToWindow do
    it "works" do
      http_client = TestHttpClient.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = SwitchToWindow.new(http_client, session_id)

      command.execute("abc")

      http_client.request_path.should eq("/session/#{session_id}/window")
      http_client.request_body.should eq({handle: "abc"}.to_json)
    end
  end
end

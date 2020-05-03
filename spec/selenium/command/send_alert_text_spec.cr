require "../../spec_helper"

module Selenium::Command
  describe SendAlertText do
    it "works" do
      http_client = TestHttpClient.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = SendAlertText.new(http_client, session_id)

      command.execute("HEY THERE!")

      http_client.request_path.should eq("/session/#{session_id}/alert/text")
      http_client.request_body.should eq({
        text: "HEY THERE!",
      }.to_json)
    end
  end
end

require "../../spec_helper"

module Selenium::Command
  describe ExecuteScript do
    it "works" do
      http_client = TestHttpClient.new
      http_client.response_value("4")
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = ExecuteScript.new(http_client, session_id)

      result = command.execute("2 + 2")

      http_client.request_path.should eq("/session/#{session_id}/execute/sync")
      http_client.request_body.should eq({
        script: "2 + 2",
        args:   [] of String,
      }.to_json)
      result.should eq("4")
    end
  end
end

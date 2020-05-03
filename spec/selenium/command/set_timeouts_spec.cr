require "../../spec_helper"

module Selenium::Command
  describe SetTimeouts do
    it "works" do
      http_client = TestHttpClient.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = SetTimeouts.new(http_client, session_id)
      timeout_configuration = TimeoutConfiguration.new(script: nil, page_load: 400)

      command.execute(timeout_configuration)

      http_client.request_path.should eq("/session/#{session_id}/timeouts")
      http_client.request_body.should eq({
        script:   nil,
        pageLoad: 400,
      }.to_json)
    end
  end
end

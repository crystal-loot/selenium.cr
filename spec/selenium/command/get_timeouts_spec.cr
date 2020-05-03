require "../../spec_helper"

module Selenium::Command
  describe GetTimeouts do
    it "works" do
      http_client = TestHttpClient.new
      http_client.response_value({
        script:   4000,
        pageLoad: 40,
        implicit: 0,
      })
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetTimeouts.new(http_client, session_id)

      result = command.execute

      http_client.request_path.should eq("/session/#{session_id}/timeouts")
      result.script.should eq(4000)
      result.page_load.should eq(40)
      result.implicit.should eq(0)
    end
  end
end

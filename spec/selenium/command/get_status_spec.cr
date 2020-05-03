require "../../spec_helper"

module Selenium::Command
  describe GetStatus do
    it "works" do
      http_client = TestHttpClient.new
      http_client.response_value({
        ready:   true,
        message: "This is fake",
      })

      command = GetStatus.new(http_client)

      result = command.execute

      result.ready?.should be_true
      result.message.should eq("This is fake")
      http_client.request_path.should eq("/status")
    end
  end
end

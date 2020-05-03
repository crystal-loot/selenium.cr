require "../../spec_helper"

module Selenium::Command
  describe NavigateTo do
    it "works" do
      http_client = TestHttpClient.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = NavigateTo.new(http_client, session_id)

      command.execute("https://example.com")

      http_client.request_path.should eq("/session/#{session_id}/url")
      http_client.request_body.should eq({url: "https://example.com"}.to_json)
    end
  end
end

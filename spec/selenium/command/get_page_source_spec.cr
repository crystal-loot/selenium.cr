require "../../spec_helper"

module Selenium::Command
  describe GetPageSource do
    it "works" do
      http_client = TestHttpClient.new
      http_client.response_value("<h1>Hey</h1>")
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetPageSource.new(http_client, session_id)

      result = command.execute

      http_client.request_path.should eq("/session/#{session_id}/source")
      result.should eq("<h1>Hey</h1>")
    end
  end
end

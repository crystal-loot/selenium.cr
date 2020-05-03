require "../../spec_helper"

module Selenium::Command
  describe NewWindow do
    it "works" do
      http_client = TestHttpClient.new
      http_client.response_value({
        handle: "abc",
        type:   "tab",
      })
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = NewWindow.new(http_client, session_id)

      result = command.execute

      http_client.request_path.should eq("/session/#{session_id}/window/new")
      result.should eq("abc")
    end
  end
end

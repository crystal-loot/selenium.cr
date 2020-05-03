require "../../spec_helper"

module Selenium::Command
  describe AcceptAlert do
    it "works" do
      http_client = TestHttpClient.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = AcceptAlert.new(http_client, session_id)

      command.execute

      http_client.request_path.should eq("/session/#{session_id}/alert/accept")
    end
  end
end

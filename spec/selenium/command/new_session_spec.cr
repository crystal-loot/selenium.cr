require "../../spec_helper"

module Selenium::Command
  describe NewSession do
    it "works" do
      http_client = TestHttpClient.new
      http_client.response_value({sessionId: "117900cd-262a-4266-889b-5e9ddb5968f6"})
      new_session = NewSession.new(http_client)

      new_session.execute.should eq("117900cd-262a-4266-889b-5e9ddb5968f6")
    end
  end
end

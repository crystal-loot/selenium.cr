require "../../spec_helper"

module Selenium::Command
  describe GetNamedCookie do
    it "works" do
      http_client = TestHttpClient.new
      cookie = Cookie.new(name: "fizz", value: "buzz")
      http_client.response_value(cookie)
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = GetNamedCookie.new(http_client, session_id)

      result = command.execute("fizz")

      http_client.request_path.should eq("/session/#{session_id}/cookie/fizz")
      result.should eq(cookie)
    end
  end
end

require "../../spec_helper"

module Selenium::Command
  describe AddCookie do
    it "works" do
      http_client = TestHttpClient.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = AddCookie.new(http_client, session_id)
      cookie = Cookie.new(name: "foo", value: "bar", http_only: true)

      command.execute(cookie)

      http_client.request_path.should eq("/session/#{session_id}/cookie")
      http_client.request_body.should eq({
        cookie: {
          name:     "foo",
          value:    "bar",
          httpOnly: true,
        },
      }.to_json)
    end
  end
end

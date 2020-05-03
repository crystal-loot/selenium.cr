require "../../spec_helper"

module Selenium::Command
  describe SetWindowRect do
    it "works" do
      http_client = TestHttpClient.new
      http_client.response_value({
        x:      100,
        y:      120,
        width:  400,
        height: 660,
      })
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = SetWindowRect.new(http_client, session_id)

      result = command.execute(width: 123, height: 456, x: 4, y: 6)

      http_client.request_path.should eq("/session/#{session_id}/window/rect")
      http_client.request_body.should eq({
        width:  123,
        height: 456,
        x:      4,
        y:      6,
      }.to_json)
      result.x.should eq(100)
      result.y.should eq(120)
      result.width.should eq(400)
      result.height.should eq(660)
    end
  end
end

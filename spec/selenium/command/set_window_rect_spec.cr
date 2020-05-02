require "../../spec_helper"

module Selenium::Command
  describe SetWindowRect do
    it "works" do
      driver = TestDriver.new
      driver.response_body = {
        x: 100,
        y: 120,
        width: 400,
        height: 660
      }.to_json
      session_id = SessionId.random
      command = SetWindowRect.new(driver, session_id)

      result = command.execute(width: 123, height: 456, x: 4, y: 6)

      driver.request_path.should eq("/session/#{session_id}/window/rect")
      driver.request_body.should eq({
        width: 123,
        height: 456,
        x: 4,
        y: 6
      }.to_json)
      result.x.should eq(100)
      result.y.should eq(120)
      result.width.should eq(400)
      result.height.should eq(660)
    end
  end
end

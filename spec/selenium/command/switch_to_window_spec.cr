require "../../spec_helper"

module Selenium::Command
  describe SwitchToWindow do
    it "works" do
      driver = TestDriver.new
      session_id = SessionId.random
      command = SwitchToWindow.new(driver, session_id)

      command.execute("abc")

      driver.request_path.should eq("/session/#{session_id}/window")
      driver.request_body.should eq({ handle: "abc" }.to_json)
    end
  end
end

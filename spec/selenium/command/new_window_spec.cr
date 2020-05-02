require "../../spec_helper"

module Selenium::Command
  describe NewWindow do
    it "works" do
      driver = TestDriver.new
      driver.response_body = {
        handle: "abc",
        type:   "tab",
      }.to_json
      session_id = SessionId.random
      command = NewWindow.new(driver, session_id)

      result = command.execute

      driver.request_path.should eq("/session/#{session_id}/window/new")
      result.handle.should eq("abc")
      result.type.should eq("tab")
    end
  end
end

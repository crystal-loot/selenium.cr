require "../../spec_helper"

module Selenium::Command
  describe CloseWindow do
    it "works" do
      driver = TestDriver.new
      session_id = SessionId.random
      command = CloseWindow.new(driver, session_id)

      command.execute

      driver.request_path.should eq("/session/#{session_id}/window")
    end
  end
end

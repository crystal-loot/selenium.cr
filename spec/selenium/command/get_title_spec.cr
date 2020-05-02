require "../../spec_helper"

module Selenium::Command
  describe GetTitle do
    it "works" do
      driver = TestDriver.new
      driver.response_body = {title: "Foo"}.to_json
      session_id = SessionId.random
      command = GetTitle.new(driver, session_id)

      command.execute.should eq("Foo")
      driver.request_path.should eq("/session/#{session_id}/title")
    end
  end
end

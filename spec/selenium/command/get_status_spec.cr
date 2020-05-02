require "../../spec_helper"

module Selenium::Command
  describe GetStatus do
    it "works" do
      driver = TestDriver.new
      driver.response_body = {
        ready: true,
        message: "This is fake"
      }.to_json

      command = GetStatus.new(driver)

      result = command.execute

      result.ready?.should be_true
      result.message.should eq("This is fake")
      driver.request_path.should eq("/status")
    end
  end
end

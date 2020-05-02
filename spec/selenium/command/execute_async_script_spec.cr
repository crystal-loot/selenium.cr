require "../../spec_helper"

module Selenium::Command
  describe ExecuteAsyncScript do
    it "works" do
      driver = TestDriver.new
      driver.response_value("4")
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = ExecuteAsyncScript.new(driver, session_id)

      result = command.execute("2 + 2")

      driver.request_path.should eq("/session/#{session_id}/execute/async")
      driver.request_body.should eq({
        script: "2 + 2",
        args:   [] of String,
      }.to_json)
      result.should eq("4")
    end
  end
end

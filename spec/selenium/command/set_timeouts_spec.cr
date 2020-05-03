require "../../spec_helper"

module Selenium::Command
  describe SetTimeouts do
    it "works" do
      driver = TestDriver.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = SetTimeouts.new(driver, session_id)
      timeout_configuration = TimeoutConfiguration.new(script: nil, page_load: 400)

      command.execute(timeout_configuration)

      driver.request_path.should eq("/session/#{session_id}/timeouts")
      driver.request_body.should eq({
        script:   nil,
        pageLoad: 400,
      }.to_json)
    end
  end
end

require "../../spec_helper"

module Selenium::Command
  describe DeleteSession do
    it "works" do
      driver = TestDriver.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      delete_session = DeleteSession.new(driver, session_id)

      delete_session.execute

      driver.request_path.should eq("/session/#{session_id}")
    end
  end
end

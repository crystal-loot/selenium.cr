require "../../spec_helper"

module Selenium::Command

  class TestDriver
    include Driver::Deleteable
    property path : String?

    def delete(path : String)
      self.path = path
    end
  end

  describe DeleteSession do
    it "works" do
      driver = TestDriver.new
      session_id = SessionId.random
      delete_session = DeleteSession.new(driver, session_id)
  
      delete_session.execute

      driver.path.should eq("/session/#{session_id}")
    end
  end
end

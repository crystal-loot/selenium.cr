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
      delete_session = DeleteSession.new(driver)
      session_id = SessionId.random
  
      delete_session.execute(session_id)

      driver.path.should eq("/session/#{session_id}")
    end
  end
end

require "../../spec_helper"

module Selenium::Command

  class TestDriver
    include Driver::Postable

    property response_body : String = ""

    def post(path, body) : String
      response_body
    end
  end

  describe NewSession do
    it "works" do
      driver = TestDriver.new
      driver.response_body = {
        value: {
          sessionId: SessionId.new("117900cd-262a-4266-889b-5e9ddb5968f6")
        }
      }.to_json
      new_session = NewSession.new(driver)

      new_session.execute.should eq(SessionId.new("117900cd-262a-4266-889b-5e9ddb5968f6"))
    end

    it "raise on blank response body" do
      driver = TestDriver.new
      driver.response_body = ""
      new_session = NewSession.new(driver)

      expect_raises(Exception, "Received no response body when create new session") { new_session.execute }
    end
  end
end

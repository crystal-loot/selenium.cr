require "../../spec_helper"

module Selenium::Command

  class TestDriver
    include Driver

    def post(path, body) : String
      {
        value: {
          sessionId: SessionId.new("117900cd-262a-4266-889b-5e9ddb5968f6")
        }
      }.to_json
    end
  end

  describe NewSession do
    it "works" do
      new_session = NewSession.new(TestDriver.new)

      new_session.execute.should eq(SessionId.new("117900cd-262a-4266-889b-5e9ddb5968f6"))
    end
  end
end

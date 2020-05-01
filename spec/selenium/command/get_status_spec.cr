require "../../spec_helper"

module Selenium::Command
  class TestDriver
    include Driver::Getable

    property path : String?

    def get(path : String) : String
      self.path = path
      {
        ready: true,
        message: "This is fake"
      }.to_json
    end
  end

  describe GetStatus do
    it "works" do
      driver = TestDriver.new

      command = GetStatus.new(driver)

      result = command.execute

      result.ready?.should be_true
      result.message.should eq("This is fake")
    end
  end
end

require "../spec_helper"

module Selenium::Command
  describe "timeoutes", tags: "feature" do
    it "works" do
      with_session do |session|
        timeout_configuration = TimeoutConfiguration.new(script: 15000)
        session.set_timeouts(timeout_configuration)

        session.timeouts.script.should eq(15000)
      end
    end
  end
end

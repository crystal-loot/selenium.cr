require "../../spec_helper"

module Selenium::Command
  describe PerformActions do
    it "works" do
      driver = TestDriver.new
      session_id = "c913bd4a033f9932a84bcd921f30793d"
      command = PerformActions.new(driver, session_id)
      
      input_action_sequence = InputSourceActionSequence.new(
        type: "key",
        id: "action-sequence-key",
        actions: [
          Action.new(type: "keyDown", value: 'a'),
          Action.new(type: "keyUp", value: 'a')
        ]
      )

      command.execute([input_action_sequence])

      driver.request_path.should eq("/session/#{session_id}/actions")
      driver.request_body.should eq({
        actions: [
          {
            type: "key",
            id: "action-sequence-key",
            actions: [
              {
                type: "keyDown",
                value: "a"
              },
              {
                type: "keyUp",
                value: "a"
              }
            ]
          }
        ]
      }.to_json)
    end
  end
end

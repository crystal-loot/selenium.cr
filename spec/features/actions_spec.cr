require "../spec_helper"

module Selenium::Command
  describe "actions", tags: "feature" do
    it "works" do
      TestServer.route "/home", <<-HTML
      <label id="label" for="foo">Foo</label>
      <input type="text" id="foo">
      HTML
      driver = Driver.new

      with_session(driver) do |session|
        session.navigate_to("localhost:3002/home")
        session.find_element(LocationStrategy::CSS, "#label").click
        input_action_sequence = InputSourceActionSequence.new(
          type: "key",
          id: "action-sequence-key",
          actions: [
            Action.new(type: "keyDown", value: 'a'),
            Action.new(type: "keyUp", value: 'a'),
          ]
        )
        session.perform_actions([input_action_sequence])
        input_element = session.find_element(LocationStrategy::CSS, "#foo")
        input_element.property("value").should eq("a")
      end
    end
  end
end

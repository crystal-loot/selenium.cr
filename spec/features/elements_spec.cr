require "../spec_helper"

module Selenium::Command
  describe "elements", tags: "feature" do
    it "can be targeted individually" do
      TestServer.route "/home", "<span id='heading'>Home</span>"
      TestServer.route "/home", <<-HTML
      <ul>
        <li data-testid="item-0">
          <p id="words">First Item</p>
        </li>
        <li data-testid="item-1">
          <p id="words">Second Item</p>
        </li>
      </ul>
      HTML

      driver = HttpDriver.new

      with_session(driver) do |session_id|
        NavigateTo.new(driver, session_id).execute("localhost:3002/home")
        element_id = FindElement.new(driver, session_id).execute(using: LocationStrategy::CSS, value: "[data-testid=\"item-1\"]")
        child_element_id = FindElementFromElement.new(driver, session_id, element_id).execute(using: LocationStrategy::CSS, value: "#words")
        element_text = GetElementText.new(driver, session_id).execute(element_id)

        element_text.should eq("Second Item")
      end
    end
  end
end

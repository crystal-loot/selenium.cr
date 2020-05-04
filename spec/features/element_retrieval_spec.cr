require "../spec_helper"

module Selenium::Command
  describe "element retrieval", tags: "feature" do
    it "can retrieve a single element" do
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

      driver = Driver.new

      with_session(driver) do |session|
        session.navigate_to("localhost:3002/home")
        element = session.find_element(LocationStrategy::CSS, "[data-testid=\"item-1\"]")
        child_element = element.find_child_element(LocationStrategy::CSS, "#words")
        child_element.text.should eq("Second Item")
      end
    end

    it "can retrieve multiple elements" do
      TestServer.route "/home", <<-HTML
      <ul>
        <li data-testid="item-0">
          <p id="words">First Item</p>
          <p>Sub Text</p>
        </li>
        <li data-testid="item-1">
          <p id="words">Second Item</p>
        </li>
      </ul>
      HTML

      driver = Driver.new

      with_session(driver) do |session|
        session.navigate_to("localhost:3002/home")
        elements = session.find_elements(LocationStrategy::CSS, "#words")
        elements.size.should eq(2)

        element = session.find_element(LocationStrategy::CSS, "[data-testid=\"item-0\"]")
        child_elements = element.find_child_elements(LocationStrategy::CSS, "p")
        child_elements.size.should eq(2)
        child_element_texts = child_elements.map &.text
        child_element_texts.should contain("First Item")
        child_element_texts.should contain("Sub Text")
      end
    end
  end
end
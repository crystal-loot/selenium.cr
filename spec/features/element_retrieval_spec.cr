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
          <p id="words" style="text-align:center;">Second Item</p>
        </li>
      </ul>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "[data-testid=\"item-1\"]")
        child_element = element.find_child_element(:css, "#words")
        child_element.text.should eq("Second Item")
        child_element.tag_name.should eq("p")
        child_element.css_value("text-align").should eq("center")
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

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        elements = session.find_elements(:css, "#words")
        elements.size.should eq(2)

        element = session.find_element(:css, "[data-testid=\"item-0\"]")
        child_elements = element.find_child_elements(:css, "p")
        child_elements.size.should eq(2)
        child_element_texts = child_elements.map &.text
        child_element_texts.should contain("First Item")
        child_element_texts.should contain("Sub Text")
      end
    end

    it "can retrieve active element" do
      TestServer.route "/home", <<-HTML
      <button data-testid="btn">Click Me</button>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "[data-testid=\"btn\"]")
        element.click
        active_element = session.active_element
        active_element.text.should eq("Click Me")
        active_element.rect.should_not be_nil
      end
    end
  end
end

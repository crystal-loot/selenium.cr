require "../spec_helper"

module Selenium::Command
  describe "element interactions", tags: "feature" do
    it "can click" do
      TestServer.route "/next-page", "<h1>You made it!</h1>"
      TestServer.route "/home", <<-HTML
        <a href="/next-page">Click Me!</a>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:link_text, "Click Me!")
        element.click
        session.current_url.should eq("http://localhost:3002/next-page")
      end
    end

    it "can clear" do
      TestServer.route "/home", <<-HTML
        <input type="text" id="name" value="John">
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#name")
        element.clear
        element.property("value").should eq("")
      end
    end

    it "can send keys" do
      TestServer.route "/home", <<-HTML
        <input type="text" id="name" value="">
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#name")
        element.send_keys("Joe")
        element.property("value").should eq("Joe")
      end
    end

    it "can send keys with unicode", tags: ["firefox"] do
      TestServer.route "/home", <<-HTML
        <input type="text" id="name" value="">
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#name")
        element.send_keys(["Montana", :add, "Joe"])
        element.property("value").should eq("Montana+Joe")
      end
    end

    it "can determine if element is enabled" do
      TestServer.route "/home", <<-HTML
      <input type="text" id="enabled-input" value="">
      <input type="text" id="disabled-input" value="" disabled>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#enabled-input")
        element.enabled?.should be_true
        element = session.find_element(:css, "#disabled-input")
        element.enabled?.should be_false
      end
    end

    it "can determine if element is selected" do
      TestServer.route "/home", <<-HTML
      <select>
        <option id="option-a" value="foo">Option A</option>
        <option id="option-b" value="bar" selected>Option B</option>
      </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#option-a")
        element.selected?.should be_false
        element = session.find_element(:css, "#option-b")
        element.selected?.should be_true
      end
    end

    it "can determine if element is displayed", tags: "safari" do
      TestServer.route "/home", <<-HTML
      <input type="text" id="visible-input" value="">
      <input type="hidden" id="hidden-input" value="">
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#visible-input")
        element.displayed?.should be_true
        element = session.find_element(:css, "#hidden-input")
        element.displayed?.should be_false
      end
    end

    it "can move the cursor to an element" do
      TestServer.route "/home", <<-HTML
      <style>
        #text:hover {
          color: rgba(83, 137, 4, 0.6);
        }
      </style>
      <p id="text">Hello, world!</p>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#text")
        element.css_value("color").should_not eq("rgba(83, 137, 4, 0.6)")
        session.move_to(element)
        session.find_element(:css, "#text").css_value("color").should eq("rgba(83, 137, 4, 0.6)")
      end
    end
  end
end

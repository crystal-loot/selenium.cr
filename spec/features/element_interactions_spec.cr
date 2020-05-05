require "../spec_helper"

module Selenium::Command
  describe "element interactions", tags: "feature" do
    it "can click" do
      TestServer.route "/next-page", "<h1>You made it!</h1>"
      TestServer.route "/home", <<-HTML
        <a href="/next-page">Click Me!</a>
      HTML
      driver = Driver.new

      with_session(driver) do |session|
        session_id = session.id
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(LocationStrategy::LINK_TEXT, "Click Me!")
        element.click
        session.current_url.should eq("http://localhost:3002/next-page")
      end
    end

    it "can clear" do
      TestServer.route "/home", <<-HTML
        <input type="text" id="name" value="John">
      HTML
      driver = Driver.new

      with_session(driver) do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(LocationStrategy::CSS, "#name")
        element.clear
        element.attribute("value").should be_empty
      end
    end

    it "can send keys" do
      TestServer.route "/home", <<-HTML
        <input type="text" id="name" value="">
      HTML
      driver = Driver.new

      with_session(driver) do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(LocationStrategy::CSS, "#name")
        element.send_keys(["Jenny", :space, "Smith"])
        element.attribute("value").should eq("Jenny Smith")
      end
    end

    it "can determine if element is enabled" do
      TestServer.route "/home", <<-HTML
      <input type="text" id="enabled-input" value="">
      <input type="text" id="disabled-input" value="" disabled>
      HTML
      driver = Driver.new

      with_session(driver) do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(LocationStrategy::CSS, "#enabled-input")
        element.enabled?.should be_true
        element = session.find_element(LocationStrategy::CSS, "#disabled-input")
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
      driver = Driver.new

      with_session(driver) do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(LocationStrategy::CSS, "#option-a")
        element.selected?.should be_false
        element = session.find_element(LocationStrategy::CSS, "#option-b")
        element.selected?.should be_true
      end
    end

    it "can determine if element is displayed" do
      TestServer.route "/home", <<-HTML
      <input type="text" id="visible-input" value="">
      <input type="hidden" id="hidden-input" value="">
      HTML
      driver = Driver.new

      with_session(driver) do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(LocationStrategy::CSS, "#visible-input")
        element.displayed?.should be_true
        element = session.find_element(LocationStrategy::CSS, "#hidden-input")
        element.displayed?.should be_false
      end
    end
  end
end

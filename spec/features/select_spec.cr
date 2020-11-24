require "../spec_helper"

describe Selenium::Helpers::Select do
  describe ".from_select" do
    it "raises an error if given an element that's not a select" do
      TestServer.route "/home", <<-HTML
        <div id="div">Not a select</div>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#div")
        expect_raises(Selenium::InvalidTagError) do
          Selenium::Helpers::Select.from_element(element)
        end
      end
    end
  end

  describe "#options" do
    it "returns an array of options for the element" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars">
          <option value="ford">Ford</option>
          <option value="honda">Honda</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        select_el.options.map(&.property("value")).should eq(["ford", "honda"])
      end
    end
  end

  describe "#selected_options" do
    it "returns options that are selected" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars">
          <option value="ford">Ford</option>
          <option value="honda" selected>Honda</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        select_el.selected_options.map(&.property("value")).should eq(["honda"])
      end
    end
  end

  describe "#multiple?" do
    it "is true if element is multiselect" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars" multiple>
          <option value="ford">Ford</option>
          <option value="honda">Honda</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        select_el.multiple?.should be_true
      end
    end

    it "is false if element is missing multiple property" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars">
          <option value="ford">Ford</option>
          <option value="honda">Honda</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        select_el.multiple?.should be_false
      end
    end
  end

  describe "#select_by_value" do
    it "selects an option by a given value" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars">
          <option value="ford">Ford</option>
          <option value="honda">Honda</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        select_el.select_by_value("honda")
        select_el.selected_options.map(&.property("value")).should eq(["honda"])
      end
    end

    it "does nothing if option already selected" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars" multiple>
          <option value="ford" selected>Ford</option>
          <option value="honda">Honda</option>
          <option value="toyota" selected>Toyota</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        select_el.select_by_value("toyota")
        select_el.selected_options.map(&.property("value")).should eq(["ford", "toyota"])
      end
    end

    it "raises an error if no option found with given value" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars">
          <option value="ford">Ford</option>
          <option value="honda">Honda</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        expect_raises(Selenium::Error) do
          select_el.select_by_value("missing-value")
        end
      end
    end
  end

  describe "#deselect_by_value" do
    it "selects an option by a given value" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars" multiple>
          <option value="ford" selected>Ford</option>
          <option value="honda">Honda</option>
          <option value="toyota" selected>Toyota</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        select_el.deselect_by_value("ford")
        select_el.selected_options.map(&.property("value")).should eq(["toyota"])
      end
    end

    it "does nothing if option not selected" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars" multiple>
          <option value="ford" selected>Ford</option>
          <option value="honda">Honda</option>
          <option value="toyota" selected>Toyota</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        select_el.deselect_by_value("honda")
        select_el.selected_options.map(&.property("value")).should eq(["ford", "toyota"])
      end
    end

    it "raises an error if no option found with given value" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars">
          <option value="ford">Ford</option>
          <option value="honda">Honda</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        expect_raises(Selenium::Error) do
          select_el.deselect_by_value("missing-value")
        end
      end
    end
  end

  describe "#select_all" do
    it "selects all available options" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars" multiple>
          <option value="ford">Ford</option>
          <option value="honda">Honda</option>
          <option value="toyota">Toyota</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        select_el.select_all
        select_el.selected_options.map(&.property("value")).should eq(["ford", "honda", "toyota"])
      end
    end

    it "raises error if select not multiple" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars">
          <option value="ford">Ford</option>
          <option value="honda">Honda</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        expect_raises(Selenium::UnsupportedOperationError) { select_el.select_all }
      end
    end
  end

  describe "#deselect_all" do
    it "deselects all selected options" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars" multiple>
          <option value="ford" selected>Ford</option>
          <option value="honda">Honda</option>
          <option value="toyota" selected>Toyota</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        select_el.deselect_all
        select_el.selected_options.map(&.property("value")).should be_empty
      end
    end

    it "raises error if select not multiple" do
      TestServer.route "/home", <<-HTML
        <select name="cars" id="cars">
          <option value="ford">Ford</option>
          <option value="honda">Honda</option>
        </select>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        element = session.find_element(:css, "#cars")
        select_el = Selenium::Helpers::Select.from_element(element)
        expect_raises(Selenium::UnsupportedOperationError) { select_el.deselect_all }
      end
    end
  end
end

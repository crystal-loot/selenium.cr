require "../spec_helper"

module Selenium::Command
  describe "logging", tags: ["feature", "chrome"] do
    it "#available_log_types" do
      TestServer.route "/home", ""

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")

        available_log_types = session.available_log_types
        available_log_types.should eq(["browser", "driver"])
      end
    end

    it "#log" do
      TestServer.route "/home", <<-HTML
        <script>
          console.warn("Hello, Console!");
        </script>
      HTML

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")

        logs = session.log("browser")
        logs.any? { |log| log.level == "WARNING" && log.message.ends_with?("\"Hello, Console!\"") }.should be_truthy
      end
    end
  end
end

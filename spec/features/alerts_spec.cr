require "../spec_helper"

module Selenium::Command
  describe "alerts", tags: "feature" do
    it "works" do
      TestServer.route "/home", "<h1>The Title</h1>"

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        document_manager = session.document_manager
        alert_manager = session.alert_manager
        document_manager.execute_script("window.prompt(\"Test Input\");")
        alert_manager.alert_text.should eq("Test Input")
        alert_manager.send_alert_text("Hello, world!")
        alert_manager.accept_alert
        document_manager.execute_script("window.alert(\"Blah:\", \"Test Input\");")
        alert_manager.dismiss_alert
      end
    end
  end
end

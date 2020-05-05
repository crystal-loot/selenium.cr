require "../spec_helper"

module Selenium::Command
  describe "document", tags: "feature" do
    it "has source that can be fetched" do
      TestServer.route "/home", "<h1>The Title</h1>"

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        page_source = session.document_manager.page_source

        page_source.should eq("<html><head></head><body><h1>The Title</h1></body></html>")
      end
    end

    it "can execute scripts" do
      TestServer.route "/home", "<h1 id=\"title\">The Title</h1>"

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        document_manager = session.document_manager
        result = document_manager.execute_script("return 1 + 1;")
        result.should eq("2")

        # not really an async script but whatever
        async_script = <<-JS
        arguments[arguments.length - 1](document.getElementById("title").textContent)
        JS
        result = document_manager.execute_async_script(async_script)

        result.should eq("The Title")
      end
    end
  end
end

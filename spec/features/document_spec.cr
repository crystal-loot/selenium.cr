require "../spec_helper"

module Selenium::Command
  describe "document", tags: "feature" do
    it "has source that can be fetched" do
      TestServer.route "/home", "<h1>The Title</h1>"
      driver = Driver.new

      with_session(driver) do |session_id|
        NavigateTo.new(driver, session_id).execute("localhost:3002/home")
        page_source = GetPageSource.new(driver, session_id).execute

        page_source.should eq("<html><head></head><body><h1>The Title</h1></body></html>")
      end
    end

    it "can execute scripts" do
      TestServer.route "/home", "<h1 id=\"title\">The Title</h1>"
      driver = Driver.new

      with_session(driver) do |session_id|
        NavigateTo.new(driver, session_id).execute("localhost:3002/home")
        result = ExecuteScript.new(driver, session_id).execute("return 1 + 1;")
        result.should eq("2")

        # not really an async script but whatever
        async_script = <<-JS
        arguments[arguments.length - 1](document.getElementById("title").textContent)
        JS
        result = ExecuteAsyncScript.new(driver, session_id).execute(async_script)

        result.should eq("The Title")
      end
    end
  end
end

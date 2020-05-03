require "../spec_helper"

module Selenium::Command
  describe "document", tags: "feature" do
    it "has source that can be fetched" do
      TestServer.route "/home", "<h1>The Title</h1>"
      driver = Driver.new
      http_client = driver.http_client

      with_session(driver) do |session|
        session_id = session.id
        NavigateTo.new(http_client, session_id).execute("localhost:3002/home")
        page_source = GetPageSource.new(http_client, session_id).execute

        page_source.should eq("<html><head></head><body><h1>The Title</h1></body></html>")
      end
    end

    it "can execute scripts" do
      TestServer.route "/home", "<h1 id=\"title\">The Title</h1>"
      driver = Driver.new
      http_client = driver.http_client

      with_session(driver) do |session|
        session_id = session.id
        NavigateTo.new(http_client, session_id).execute("localhost:3002/home")
        result = ExecuteScript.new(http_client, session_id).execute("return 1 + 1;")
        result.should eq("2")

        # not really an async script but whatever
        async_script = <<-JS
        arguments[arguments.length - 1](document.getElementById("title").textContent)
        JS
        result = ExecuteAsyncScript.new(http_client, session_id).execute(async_script)

        result.should eq("The Title")
      end
    end
  end
end

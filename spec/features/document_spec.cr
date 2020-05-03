require "../spec_helper"

module Selenium::Command
  describe "document", tags: "feature" do
    it "hhas source that can be fetched" do
      TestServer.route "/home", "<h1>The Title</h1>"
      driver = HttpDriver.new

      with_session(driver) do |session_id|
        NavigateTo.new(driver, session_id).execute("localhost:3002/home")
        page_source = GetPageSource.new(driver, session_id).execute

        page_source.should eq("<html><head></head><body><h1>The Title</h1></body></html>")
      end
    end
  end
end

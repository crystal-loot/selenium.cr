require "../spec_helper"

module Selenium::Command
  describe "WebStorageManager", tags: "feature" do
    it "works for localStorage" do
      TestServer.route "/home", "<h1>The Title</h1>"

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        local_storage_manager = session.local_storage_manager

        local_storage_manager.item("foo", "barr")
        item = local_storage_manager.item("foo")
        item.should eq("barr")

        local_storage_manager.size.should eq(1)

        local_storage_manager.item("fizz", "buzz")
        item = local_storage_manager.item("fizz")
        item.should eq("buzz")

        local_storage_manager.size.should eq(2)

        local_storage_manager.item("foo", "bazz")
        item = local_storage_manager.item("foo")
        item.should eq("bazz")

        names = local_storage_manager.keys
        names.should eq(["foo", "fizz"])

        local_storage_manager.clear
        local_storage_manager.size.should eq(0)
      end
    end

    it "works for sessionStorage" do
      TestServer.route "/home", "<h1>The Title</h1>"

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        session_storage_manager = session.session_storage_manager

        session_storage_manager.item("foo", "barr")
        item = session_storage_manager.item("foo")
        item.should eq("barr")

        session_storage_manager.size.should eq(1)

        session_storage_manager.item("fizz", "buzz")
        item = session_storage_manager.item("fizz")
        item.should eq("buzz")

        session_storage_manager.size.should eq(2)

        session_storage_manager.item("foo", "bazz")
        item = session_storage_manager.item("foo")
        item.should eq("bazz")

        names = session_storage_manager.keys
        names.should eq(["foo", "fizz"])

        session_storage_manager.clear
        session_storage_manager.size.should eq(0)
      end
    end
  end
end

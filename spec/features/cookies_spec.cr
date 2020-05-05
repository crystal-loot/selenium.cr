require "../spec_helper"

module Selenium::Command
  describe "cookies", tags: "feature" do
    it "works" do
      TestServer.route "/home", "<h1>The Title</h1>"

      with_session do |session|
        session.navigate_to("http://localhost:3002/home")
        cookie_manager = session.cookie_manager
        cookie_manager.add_cookie(Cookie.new(name: "foo", value: "bar"))
        cookie = cookie_manager.get_cookie("foo")
        cookie.value.should eq("bar")
        cookie_manager.add_cookie("fizz", "buzz")
        cookies = cookie_manager.get_all_cookies
        cookies.size.should eq(2)
        cookie_manager.delete_cookie("fizz")
        cookie_manager.delete_all_cookies
        cookie_manager.get_all_cookies.should be_empty
      end
    end
  end
end

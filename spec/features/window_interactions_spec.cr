require "../spec_helper"

module Selenium::Command
  describe "window", tags: "feature" do
    it "can be interacted with" do
      driver = Driver.new

      with_session(driver) do |session|
        driver.status.ready?.should be_true
        window_manager = session.window_manager
        window_manager.fullscreen
        window_manager.maximize
        window_handle_a = window_manager.window_handle
        window_handle_b = window_manager.new_window
        window_handles = window_manager.window_handles
        window_handles.should contain(window_handle_a)
        window_handles.should contain(window_handle_b)
        window_manager.window_handle.should eq(window_handle_a)
        window_manager.switch_to_window(window_handle_b)
        window_manager.window_handle.should eq(window_handle_b)
        window_manager.set_window_rect(width: 1200)
        window_rect = window_manager.window_rect
        window_rect.width.should eq(1200)
        window_manager.close_window
      end
    end
  end
end

require "../spec_helper"

module Selenium::Command
  describe "window", tags: "feature" do
    it "can be interacted with", tags: "safari" do
      with_session do |session|
        window_manager = session.window_manager
        window_manager.maximize
        window_handle_a = window_manager.window_handle
        window_handle_b = window_manager.new_window
        window_handles = window_manager.window_handles
        window_handles.should contain(window_handle_a)
        window_handles.should contain(window_handle_b)
        window_manager.window_handle.should eq(window_handle_a)
        window_manager.switch_to_window(window_handle_b)
        window_manager.window_handle.should eq(window_handle_b)
        window_manager.resize_window(width: 1600, height: 700)
        window_manager.window_rect.width.should eq(1600)
        window_manager.close_window
        window_manager.window_handles.size.should eq(1)
      end
    end
  end
end

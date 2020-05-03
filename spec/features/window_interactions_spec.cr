require "../spec_helper"

module Selenium::Command
  describe "window", tags: "feature" do
    it "can be interacted with" do
      driver = HttpDriver.new

      with_session(driver) do |session_id|
        status = GetStatus.new(driver).execute
        status.ready?.should be_true
        FullscreenWindow.new(driver, session_id).execute
        MaximizeWindow.new(driver, session_id).execute
        window_handle_a = GetWindowHandle.new(driver, session_id).execute
        window_handle_b = NewWindow.new(driver, session_id).execute
        window_handles = GetWindowHandles.new(driver, session_id).execute
        window_handles.should contain(window_handle_a)
        window_handles.should contain(window_handle_b)
        SwitchToWindow.new(driver, session_id).execute(window_handle_a)
        SetWindowRect.new(driver, session_id).execute(width: 100, height: 300)

        CloseWindow.new(driver, session_id).execute
      end
    end
  end
end

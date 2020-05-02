require "../spec_helper"

module Selenium::Command
  describe "window", tags: "feature" do
    it "can be interacted with" do
      driver = HttpDriver.new

      session_id = NewSession.new(driver).execute
      FullscreenWindow.new(driver, session_id).execute
      MaximizeWindow.new(driver, session_id).execute
      window_handle_a = GetWindowHandle.new(driver, session_id).execute
      window_handle_b = NewWindow.new(driver, session_id).execute
      SwitchToWindow.new(driver, session_id).execute(window_handle_a)
      SetWindowRect.new(driver, session_id)
        .execute(width: 100, height: 300)

      CloseWindow.new(driver, session_id).execute
      CloseWindow.new(driver, session_id).execute
      DeleteSession.new(driver, session_id).execute
    end
  end
end

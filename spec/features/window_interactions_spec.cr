require "../spec_helper"

module Selenium::Command
  describe "window", tags: "feature" do
    it "can be interacted with" do
      http_client = HttpClient.new

      with_session(http_client) do |session_id|
        status = GetStatus.new(http_client).execute
        status.ready?.should be_true
        FullscreenWindow.new(http_client, session_id).execute
        MaximizeWindow.new(http_client, session_id).execute
        window_handle_a = GetWindowHandle.new(http_client, session_id).execute
        window_handle_b = NewWindow.new(http_client, session_id).execute
        window_handles = GetWindowHandles.new(http_client, session_id).execute
        window_handles.should contain(window_handle_a)
        window_handles.should contain(window_handle_b)
        SwitchToWindow.new(http_client, session_id).execute(window_handle_a)
        SetWindowRect.new(http_client, session_id).execute(width: 100, height: 300)

        CloseWindow.new(http_client, session_id).execute
      end
    end
  end
end

class Selenium::WindowManager
  getter session : Session

  def initialize(@session)
  end

  def fullscreen
    Command::FullscreenWindow.new(http_client, session_id).execute
  end

  def maximize
    Command::MaximizeWindow.new(http_client, session_id).execute
  end

  def window_handle
    Command::GetWindowHandle.new(http_client, session_id).execute
  end

  def window_handles
    Command::GetWindowHandles.new(http_client, session_id).execute
  end

  def new_window
    Command::NewWindow.new(http_client, session_id).execute
  end

  def switch_to_window(window_handle)
    Command::SwitchToWindow.new(http_client, session_id).execute(window_handle)
  end

  def set_window_rect(
    width : Int32? = nil,
    height : Int32? = nil,
    x : Int32? = nil,
    y : Int32? = nil
  ) : WindowRect
    Command::SetWindowRect.new(http_client, session_id)
      .execute(width: width, height: height, x: x, y: y)
  end

  def close_window
    Command::CloseWindow.new(http_client, session_id).execute
  end

  private def http_client
    session.http_client
  end

  private def session_id
    session.id
  end
end

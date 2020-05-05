class Selenium::WindowManager
  getter command_handler : CommandHandler
  getter session_id : SessionId

  def initialize(@command_handler, @session_id)
  end

  def fullscreen
    data = command_handler.execute(:fullscreen_window, path_variables)
    WindowRect.from_json(data["value"].to_json)
  end

  def maximize
    data = command_handler.execute(:maximize_window, path_variables)
    WindowRect.from_json(data["value"].to_json)
  end

  def minimize
    data = command_handler.execute(:minimize_window, path_variables)
    WindowRect.from_json(data["value"].to_json)
  end

  def window_handle
    data = command_handler.execute(:get_window_handle, path_variables)
    data["value"].as_s
  end

  def window_handles
    data = command_handler.execute(:get_window_handles, path_variables)
    data["value"].as_a.map &.as_s
  end

  def new_window
    data = command_handler.execute(:new_window, path_variables)
    data.dig("value", "handle").as_s
  end

  def switch_to_window(window_handle)
    command_handler.execute(:switch_to_window, path_variables, {handle: window_handle}.to_json)
  end

  def set_window_rect(window_rect)
    parameters = window_rect.to_json
    data = command_handler.execute(:set_window_rect, path_variables, parameters)
    WindowRect.from_json(data["value"].to_json)
  end

  def set_window_rect(
    width : Int32? = nil,
    height : Int32? = nil,
    x : Int32? = nil,
    y : Int32? = nil
  ) : WindowRect
    window_rect = WindowRect.new(width: width, height: height, x: x, y: y)
    set_window_rect(window_rect)
  end

  def resize_window(width : Int32? = nil, height : Int32? = nil)
    set_window_rect(width, height)
  end

  def window_rect
    data = command_handler.execute(:get_window_rect, path_variables)
    WindowRect.from_json(data["value"].to_json)
  end

  def close_window
    command_handler.execute(:close_window, path_variables)
  end

  private def path_variables
    {":session_id" => session_id}
  end
end

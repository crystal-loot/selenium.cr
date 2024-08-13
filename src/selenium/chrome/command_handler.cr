class Selenium::Chrome::CommandHandler < Selenium::CommandHandler
  CHROME_COMMANDS = {
    get_available_log_types: {:get, "/session/:session_id/se/log/types"},
    get_log:                 {:post, "/session/:session_id/se/log"},
  }

  def commands
    DEFAULT_COMMANDS.merge(CHROME_COMMANDS)
  end
end

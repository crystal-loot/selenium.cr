module Selenium::Driver
  DEFAULT_CONFIGURATION = {
    base_url: "http://localhost:4444/wd/hub",
  }

  def self.for(browser, opts = DEFAULT_CONFIGURATION)
    options = DEFAULT_CONFIGURATION.merge(opts)
    case browser
    when :chrome
      Chrome::Driver.new(options)
    when :firefox, :gecko
      Firefox::Driver.new(options)
    when :remote
      Remote::Driver.new(options)
    else
      raise ArgumentError.new "unknown driver: #{browser}"
    end
  end
end

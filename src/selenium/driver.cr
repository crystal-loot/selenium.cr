module Selenium::Driver
  def self.for(browser, opts = nil)
    case browser
    when :chrome
      Chrome::Driver.new(opts)
    when :firefox, :gecko
      Firefox::Driver.new(opts)
    when :remote
      Remote::Driver.new(opts)
    else
      raise ArgumentError.new "unknown driver: #{browser}"
    end
  end
end

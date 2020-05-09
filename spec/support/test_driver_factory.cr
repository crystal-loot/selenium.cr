class Selenium::TestDriverFactory
  def self.build(browser) : Tuple(Driver, Capabilities)
    case browser
    when "chrome"
      build_chrome_driver
    when "firefox"
      build_firefox_driver
    when "chrome-no-service"
      build_chrome_driver_no_service
    when "safari"
      build_safari_driver
    else
      raise ArgumentError.new("unknown browser for running tests: #{browser}")
    end
  end

  def self.build_chrome_driver : Tuple(Driver, Capabilities)
    capabilities = Chrome::Capabilities.new
    capabilities.args(["no-sandbox", "headless", "disable-gpu"])
    driver = Driver.for(:chrome, service: Service.chrome(driver_path: Webdrivers::Chromedriver.install))
    {driver, capabilities}
  end

  def self.build_firefox_driver : Tuple(Driver, Capabilities)
    capabilities = Firefox::Capabilities.new
    capabilities.args(["-headless"])
    driver = Driver.for(:firefox, service: Service.firefox(driver_path: Webdrivers::Geckodriver.install))
    {driver, capabilities}
  end

  def self.build_chrome_driver_no_service : Tuple(Driver, Capabilities)
    capabilities = Chrome::Capabilities.new
    capabilities.args(["no-sandbox", "headless", "disable-gpu"])
    driver = Driver.for(:chrome, base_url: "http://localhost:9515")
    {driver, capabilities}
  end

  def self.build_safari_driver : Tuple(Driver, Capabilities)
    driver = Driver.for(:safari, service: Service.safari(driver_path: "/usr/bin/safaridriver"))
    {driver, Safari::Capabilities.new}
  end
end

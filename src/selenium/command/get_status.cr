class Selenium::Command::GetStatus
  getter driver : Driver::Getable
  def initialize(@driver)
  end

  def execute : Status
    Status.from_json(driver.get("/status"))
  end
end

class Selenium::Command::GetStatus
  getter driver : Driver::Getable

  def initialize(@driver)
  end

  def execute : Status
    response_body = driver.get("/status")

    ready = response_body.dig("value", "ready").as_bool
    message = response_body.dig("value", "message").as_s

    Status.new(ready, message)
  end
end

class Selenium::Command::SetTimeouts
  getter driver : Driver::Postable

  def initialize(@driver)
  end

  # POST
  # /session/:session_id/timeouts
  def execute
    raise "Not implemented yet"
  end
end

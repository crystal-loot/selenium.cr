class Selenium::Command::GetTimeouts
  getter driver : Driver::Getable
  def initialize(@driver)
  end

  # GET
  # /session/:session_id/timeouts
  def execute
    raise "Not implemented"
  end
end

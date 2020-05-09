class Selenium::Safari::Service < Selenium::Service
  def default_port : Int32
    7050
  end

  def stop
    stop_process(process)
  end
end

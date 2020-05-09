class Selenium::Firefox::Service < Selenium::Service
  def default_port : Int32
    4444
  end

  def stop
    stop_process(process)
  end
end

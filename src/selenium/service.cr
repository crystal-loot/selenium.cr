abstract class Selenium::Service
  CONNECTION_INTERVAL = 1.seconds
  CONNECTION_TIMEOUT  = 5.seconds

  def self.chrome(**opts)
    Chrome::Service.new(**opts)
  end

  def self.firefox(**opts)
    Firefox::Service.new(**opts)
  end

  def self.safari(**opts)
    Safari::Service.new(**opts)
  end

  private property process : Process?

  def initialize(@driver_path : String, @port : Int32 = default_port, @args = [] of String)
  end

  def start
    find_free_port
    start_process
    verify_running
  end

  def stop
    send_shutdown_command
    process.try &.wait
  ensure
    stop_process(process)
  end

  def base_url : String
    "http://localhost:#{@port}"
  end

  abstract def default_port : Int32

  private def find_free_port
    while listening?
      @port += 1
    end
  end

  private def start_process
    @process = Process.new(
      @driver_path,
      ["--port=#{@port}"] | @args,
      shell: spawn_in_shell?,
      output: {% if flag?(:DEBUG) %} STDOUT {% else %} Process::Redirect::Close {% end %},
      error: {% if flag?(:DEBUG) %} STDERR {% else %} Process::Redirect::Close {% end %}
    )
  end

  private def verify_running
    result = with_timeout { listening? }
    raise "Unable to connect to driver process. Try running in DEBUG mode to find more information." unless result
  end

  private def with_timeout(&)
    max_time = Time.utc + CONNECTION_TIMEOUT

    until Time.utc > max_time
      return true if yield

      sleep CONNECTION_INTERVAL
    end

    false
  end

  private def listening?
    TCPSocket.new("localhost", @port).close
    true
  rescue
    false
  end

  private def send_shutdown_command
    return if @process.nil? || @process.try &.terminated?

    HTTP::Client.new(host: "localhost", port: @port) do |client|
      client.connect_timeout = 10
      client.read_timeout = 10
      headers = HTTP::Headers{
        "Accept"       => "application/json",
        "Content-Type" => "application/json; charset=UTF-8",
        "User-Agent"   => "selenium/#{Selenium::VERSION} (crystal #{os})",
      }
      client.get("/shutdown", headers)
    end
  end

  private def stop_process(process)
    return if process.nil? || process.terminated?

    {% if compare_versions(Crystal::VERSION, "1.8.0") < 0 %}
      process.terminate
    {% else %}
      process.terminate(graceful: false)
    {% end %}
  end

  private def spawn_in_shell?
    os == "macos"
  end

  private def os
    {% if flag?(:darwin) %}
      "macos"
    {% elsif flag?(:win32) %}
      "windows"
    {% elsif flag?(:linux) %}
      "linux"
    {% else %}
      "other"
    {% end %}
  end
end

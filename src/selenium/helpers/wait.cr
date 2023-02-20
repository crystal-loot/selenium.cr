class Selenium::Helpers::Wait
  @timeout : Time::Span
  @interval : Time::Span
  @ignored = [] of Exception

  # Create a new `Wait` instance.
  #
  # `timeout` - seconds to wait before timing out
  # `interval` - seconds to sleep between polls
  # `message` - exception mesage if timed out
  # `ignored` - exceptions to ignore while polling
  def initialize(@timeout = 5.seconds, @interval = 0.2.seconds, @ignored = [Selenium::Error], @message : String? = nil)
  end

  # Wait until the given block returns a `true` value.
  # Otherwise raise an exception `IO::TimeoutError`.
  #
  # ```
  # wait = Selenium::Helpers::Wait.new(timeout: 10.seconds, interval: 1.second)
  # wait.until { session.document_manager.execute_script("return document.readyState;") == "complete" }
  # ```
  def until(&) : Nil
    end_time = current_time + @timeout
    last_error : Exception? = nil

    until current_time > end_time
      begin
        result = yield

        return result if result
      rescue ex
        last_error = ex

        raise ex unless @ignored.includes?(ex.class)
      end

      sleep @interval
    end

    message = @message || "timed out after #{@timeout.seconds} seconds"

    message = message + " (#{last_error.message})" if last_error

    raise IO::TimeoutError.new(message)
  end

  private def current_time
    Time.utc
  end
end

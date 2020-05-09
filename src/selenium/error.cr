class Selenium::Error < Exception
  JSON.mapping(
    error: String,
    error_message: {type: String, key: "message"},
    stacktrace: String,
    data: JSON::Any?
  )

  def message
    [@error, @error_message].reject(&.blank?).join(": ")
  end
end

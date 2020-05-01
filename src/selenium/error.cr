struct Selenium::Error
  JSON.mapping(
    value: ErrorValue
  )

  struct ErrorValue
    JSON.mapping(
      error: String,
      message: String,
      stacktrace: String,
      data: JSON::Any?
    )
  end
end

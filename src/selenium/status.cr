class Selenium::Status
  JSON.mapping(
    ready: Bool,
    message: String
  )

  def ready?
    @ready
  end
end

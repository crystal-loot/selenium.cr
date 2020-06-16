class Selenium::Error
  include JSON::Serializable

  property error : String
  property stacktrace : String
  property data : JSON::Any?

  @[JSON::Field(key: "message")]
  property error_message : String

  def to_exception
    message = [error, error_message].reject(&.blank?).join(": ")
    Exception.new(message)
  end
end

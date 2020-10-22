class Selenium::Error < Exception
  def self.from_json(json)
    new(InternalData.from_json(json))
  end

  private getter internal_data : InternalData

  def initialize(@internal_data)
  end

  def message
    [internal_data.error, internal_data.error_message].reject(&.blank?).join(": ")
  end

  class InternalData
    include JSON::Serializable

    property error : String
    property stacktrace : String
    property data : JSON::Any?

    @[JSON::Field(key: "message")]
    property error_message : String
  end
end

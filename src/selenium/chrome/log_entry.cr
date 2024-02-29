class Selenium::Chrome::LogEntry
  include JSON::Serializable

  property level : String
  property message : String
  property source : String?
  property timestamp : Int64
end

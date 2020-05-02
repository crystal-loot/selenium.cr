struct Selenium::Cookie
  include JSON::Serializable

  getter name : String
  getter value : String
  property path : String?
  property domain : String?
  property secure : Bool?
  @[JSON::Field(key: "httpOnly")]
  property http_only : Bool?
  property expiry : Int64?
  @[JSON::Field(key: "sameSite")]
  property same_site : String?

  def initialize(
    @name,
    @value,
    @path = nil,
    @domain = nil,
    @secure = nil,
    @http_only = nil,
    @expiry = nil,
    @same_site = nil
  )
  end
end

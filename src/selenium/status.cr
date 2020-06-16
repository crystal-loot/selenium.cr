class Selenium::Status
  include JSON::Serializable

  property ready : Bool
  property message : String

  def ready?
    @ready
  end
end

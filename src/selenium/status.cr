class Selenium::Status
  getter message : String

  def initialize(@ready : Bool, @message)
  end

  def ready?
    @ready
  end
end

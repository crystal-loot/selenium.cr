alias Selenium::SessionId = UUID

class Selenium::Session
  getter session_id : SessionId

  def initialize(@session_id)
  end
end

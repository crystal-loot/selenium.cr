class Selenium::Command::NewWindow
  def initialize(@driver : Driver::Postable, @session_id : SessionId)
  end

  def execute : Result
    response_body = @driver.post("/session/#{@session_id}/window/new")

    Result.from_json(response_body)
  end

  struct Result
    include JSON::Serializable
    property handle : String
    property type : String
  end
end

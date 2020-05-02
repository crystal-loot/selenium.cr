class Selenium::Command::NewSession
  getter driver : Driver::Postable

  def initialize(@driver)
  end

  def execute(capabilities : Hash(String, _) = {} of String => String) : SessionId
    response_body = driver.post("/session", {capabilities: capabilities}.to_json)
    response_body.dig("value", "sessionId").as_s
  end
end

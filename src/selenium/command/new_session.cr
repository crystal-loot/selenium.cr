class Selenium::Command::NewSession
  getter driver : Driver::Postable

  def initialize(@driver)
  end

  def execute(capabilities : Hash(String, _) = {} of String => String) : SessionId
    result = driver.post("/session", {capabilities: capabilities}.to_json)
    raise "Received no response body when create new session" if result.blank?
    json_body = JSON.parse(result)
    SessionId.new(json_body["value"]["sessionId"].as_s)
  end
end

class Selenium::Command::NewSession
  getter driver : Driver::Postable

  def initialize(@driver)
  end

  def execute(capabilities : Hash(String, _) = {} of String => String) : SessionId
    result = driver.post("/session", {capabilities: capabilities}.to_json)
    JSON.parse(result)["sessionId"].as_s
  end
end

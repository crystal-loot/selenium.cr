class Selenium::Command::NewSession
  getter driver : Driver

  def initialize(@driver)
  end

  def execute(capabilities : Hash(String, _) = {} of String => String) : Session
    result = driver.post("/session", {capabilities: capabilities}.to_json)
    json_body = JSON.parse(result)
    session_id = UUID.new(json_body["value"]["sessionId"].as_s)
    Session.new(session_id)
  end
end

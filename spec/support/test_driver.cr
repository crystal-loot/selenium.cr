class Selenium::TestDriver
  include Driver

  property request_path : String?
  property request_body : String?
  property response_body : String = ""

  def delete(path : String)
    self.request_path = path
  end

  def get(path : String) : String
    self.request_path = path
    response_body
  end

  def post(path, body) : String
    self.request_path = path
    self.request_body = body
    response_body
  end

  def parsed_request_body : JSON::Any
    JSON.parse(request_body.not_nil!)
  end
end

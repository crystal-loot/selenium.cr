class Selenium::TestDriver < Selenium::Driver
  EMPTY_RESPONSE = JSON.parse({value: nil}.to_json)

  property request_path : String?
  property request_body : String?
  property response_body : JSON::Any = EMPTY_RESPONSE

  def delete(path : String)
    self.request_path = path
  end

  def get(path : String) : JSON::Any
    self.request_path = path
    response_body
  end

  def post(path, body = nil) : JSON::Any
    self.request_path = path
    self.request_body = body
    response_body
  end

  def response_value(value)
    raw_json = JSON.build do |json|
      json.object do
        json.field "value", value
      end
    end

    self.response_body = JSON.parse(raw_json)
  end
end

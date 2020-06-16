class Selenium::HttpClient
  getter base_url : String

  def initialize(@base_url)
  end

  def post(path, body = "{}") : JSON::Any
    url = base_url + path
    response = HTTP::Client.post(url, body: body)
    parsed_response = JSON.parse(response.body)

    if has_error?(parsed_response)
      raise Error.from_json(parsed_response["value"].to_json)
    end
    parsed_response
  end

  def delete(path) : JSON::Any
    response = HTTP::Client.delete(base_url + path)
    parsed_response = JSON.parse(response.body)

    if has_error?(parsed_response)
      raise Error.from_json(parsed_response["value"].to_json)
    end
    parsed_response
  end

  def get(path) : JSON::Any
    response = HTTP::Client.get(base_url + path)
    parsed_response = JSON.parse(response.body)

    if has_error?(parsed_response)
      raise Error.from_json(parsed_response["value"].to_json)
    end
    parsed_response
  end

  private def has_error?(response_body)
    response_body["value"].raw.is_a?(Hash) && response_body.dig?("value", "error")
  end
end

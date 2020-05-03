class Selenium::HttpDriver
  include Driver

  def post(path, body = "{}") : JSON::Any
    url = base_path + path
    response = HTTP::Client.post(url, body: body)
    parsed_response = JSON.parse(response.body)

    if has_error?(parsed_response)
      raise Error.from_json(parsed_response["value"].to_json)
    end
    parsed_response
  end

  def delete(path) : JSON::Any
    response = HTTP::Client.delete(base_path + path)
    parsed_response = JSON.parse(response.body)

    if has_error?(parsed_response)
      raise Error.from_json(parsed_response["value"].to_json)
    end
    parsed_response
  end

  def get(path) : JSON::Any
    response = HTTP::Client.get(base_path + path)
    parsed_response = JSON.parse(response.body)

    if has_error?(parsed_response)
      raise Error.from_json(parsed_response["value"].to_json)
    end
    parsed_response
  end

  def base_path
    "localhost:4444/wd/hub"
  end

  private def has_error?(response_body)
    response_body["value"].raw.is_a?(Hash) && response_body.dig?("value", "error")
  end
end

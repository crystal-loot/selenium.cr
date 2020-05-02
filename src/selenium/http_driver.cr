class Selenium::HttpDriver
  include Driver

  def post(path, body = "{}") : JSON::Any
    url = base_path + path
    response = HTTP::Client.post(url, body: body)
    JSON.parse(response.body)
  end

  def delete(path)
    HTTP::Client.delete(base_path + path)
  end

  def get(path) : JSON::Any
    response = HTTP::Client.get(base_path + path)
    JSON.parse(response.body)
  end

  def base_path
    "localhost:4444/wd/hub"
  end
end

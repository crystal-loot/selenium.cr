class Selenium::HttpDriver
  include Driver

  def post(path, body = "{}") : String
    url = base_path + path
    response = HTTP::Client.post(url, body: body)
    JSON.parse(response.body)["value"].to_json
  end

  def delete(path)
    HTTP::Client.delete(base_path + path)
  end

  def get(path) : String
    HTTP::Client.get(base_path + path).body
  end

  def base_path
    "localhost:4444/wd/hub"
  end
end

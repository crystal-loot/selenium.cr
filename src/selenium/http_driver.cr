class Selenium::HttpDriver
  include Driver

  def post(path, body = nil) : String
    response = HTTP::Client.post(base_path + path, body: body)
    response.body
  end

  def delete(path)
    HTTP::Client.delete(base_path + path)
  end

  def get(path) : String
    HTTP::Client.get(path).body
  end

  def base_path
    "localhost:4444/wd/hub"
  end
end
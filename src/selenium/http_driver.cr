class Selenium::HttpDriver
  include Driver

  def post(path, body) : String
    response = HTTP::Client.post(base_path + path, body: body)
    response.body
  end

  def delete(path)
    HTTP::Client.delete(base_path + path)
  end

  def base_path
    "localhost:4444/wd/hub"
  end
end

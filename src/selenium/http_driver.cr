class Selenium::HttpDriver
  include Driver

  def post(path, body) : String
    response = HTTP.post("localhost:4444/wd/hub#{path}", body: body)
    response.body
  end
end

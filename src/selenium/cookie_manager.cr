class Selenium::CookieManager
  getter command_handler : CommandHandler
  getter session_id : SessionId

  def initialize(@command_handler, @session_id)
  end

  def get_all_cookies
    data = command_handler.execute(:get_all_cookies, path_variables)

    Array(Cookie).from_json(data["value"].to_json)
  end

  def get_cookie(name)
    data = command_handler.execute(:get_named_cookie, path_variables.merge({":name" => name}))

    Cookie.from_json(data["value"].to_json)
  end

  def add_cookie(cookie)
    parameters = {cookie: cookie}
    command_handler.execute(:add_cookie, path_variables, parameters)
  end

  def add_cookie(name, value)
    cookie = Cookie.new(name, value)
    add_cookie(cookie)
  end

  def delete_cookie(name)
    command_handler.execute(:delete_cookie, path_variables.merge({":name" => name}))
  end

  def delete_all_cookies
    command_handler.execute(:delete_all_cookies, path_variables)
  end

  private def path_variables
    {":session_id" => session_id}
  end
end

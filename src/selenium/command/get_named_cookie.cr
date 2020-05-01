class Selenium::Command::GetNamedCookie
  def initialize(@session_id, @name)
    @method = "GET"
    @route = "/session/#{@session_id}/cookie/#{@name}"
  end
end

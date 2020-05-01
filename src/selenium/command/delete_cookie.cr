class Selenium::Command::DeleteCookie
  def initialize(@session_id, @name)
    @method = "DELETE"
    @route = "/session/#{@session_id}/cookie/#{@name}"
  end
end

class Selenium::Command::GetElementAttribute
  def initialize(@session_id, @element_id, @name)
    @method = "GET"
    @route = "/session/#{@session_id}/element/#{@element_id}/attribute/#{@name}"
  end
end

class Selenium::Command::GetElementProperty
  def initialize(@session_id : UUID, @element_id, @name)
    @method = "GET"
    @route = "/session/#{@session_id}/element/#{@element_id}/property/#{@name}"
  end
end

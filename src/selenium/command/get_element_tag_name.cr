class Selenium::Command::GetElementTagName
  def initialize(@session_id, @element_id)
    @method = "GET"
    @route = "/session/#{@session_id}/element/#{@element_id}/name"
  end
end

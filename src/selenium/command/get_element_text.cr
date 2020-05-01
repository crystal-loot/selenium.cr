class Selenium::Command::GetElementText
  def initialize(@session_id : UUID, @element_id)
    @method = "GET"
    @route = "/session/#{@session_id}/element/#{@element_id}/text"
  end
end

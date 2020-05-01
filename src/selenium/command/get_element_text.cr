class Selenium::Command::GetElementText
  def initialize(@session_id, @element_id)
    @method = "GET"
    @route = "/session/#{@session_id}/element/#{@element_id}/text"
  end
end

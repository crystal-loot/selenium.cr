class Selenium::Command::GetElementCssValue
  def initialize(@session_id, @element_id, @property_name)
    @method = "GET"
    @route = "/session/#{@session_id}/element/#{@element_id}/css/#{@property_name}"
  end
end

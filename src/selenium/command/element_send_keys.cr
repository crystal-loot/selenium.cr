class Selenium::Command::ElementSendKeys
  def initialize(@session_id : UUID, @element_id)
    @method = "POST"
    @route = "/session/#{@session_id}/element/#{@element_id}/value"
  end
end

class Selenium::Command::ElementClear
  def initialize(@session_id, @element_id)
    @method = "POST"
    @route = "/session/#{@session_id}/element/#{@element_id}/clear"
  end
end

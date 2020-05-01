class Selenium::Command::IsElementSelected
  def initialize(@session_id, @element_id)
    @method = "GET"
    @route = "/session/#{@session_id}/element/#{@element_id}/selected"
  end
end

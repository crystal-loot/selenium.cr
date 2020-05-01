class Selenium::Command::NewSession
  def initialize
    @method = "POST"
    @route = "/session"
  end
end

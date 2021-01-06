class Selenium::Remote::Driver < Selenium::Driver
  def create_session(args : Array(String)) : Session
    create_session(Selenium::Capabilities.new)
  end
end

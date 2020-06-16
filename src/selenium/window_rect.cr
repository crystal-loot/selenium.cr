struct Selenium::WindowRect
  include JSON::Serializable

  property x : Int64?
  property y : Int64?
  property width : Int64?
  property height : Int64?

  def initialize(@x = nil, @y = nil, @width = nil, @height = nil)
  end
end

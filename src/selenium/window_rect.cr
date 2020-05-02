struct Selenium::WindowRect
  getter x : Int32
  getter y : Int32
  getter width : Int32
  getter height : Int32

  def initialize(@x, @y, @width, @height)
  end
end

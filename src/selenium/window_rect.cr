struct Selenium::Rect
  JSON.mapping(
    x: Int32,
    y: Int32,
    width: Int32,
    height: Int32
  )

  def initialize(@x, @y, @width, @height)
  end
end

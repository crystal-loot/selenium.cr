struct Selenium::WindowRect
  JSON.mapping(
    x: Int64?,
    y: Int64?,
    width: Int64?,
    height: Int64?
  )

  def initialize(@x = nil, @y = nil, @width = nil, @height = nil)
  end
end

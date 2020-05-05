struct Selenium::Rect
  JSON.mapping(
    x: Int32?,
    y: Int32?,
    width: Int32?,
    height: Int32?
  )

  def initialize(@x = nil, @y = nil, @width = nil, @height = nil)
  end
end

struct Selenium::ElementRect
  JSON.mapping(
    x: Float64?,
    y: Float64?,
    width: Float64?,
    height: Float64?
  )

  def initialize(@x = nil, @y = nil, @width = nil, @height = nil)
  end
end

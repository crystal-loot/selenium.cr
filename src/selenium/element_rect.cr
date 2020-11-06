# TODO: I don't remember why I made the properties floats nor why they are nilable.
# If they were Int64, this could be combined with `Selenium::WindowRect`
struct Selenium::ElementRect
  include JSON::Serializable

  property x : Float64?
  property y : Float64?
  property width : Float64?
  property height : Float64?

  def midpoint : Selenium::Coordinate?
    temp_x = x
    temp_y = y
    temp_width = width
    temp_height = height

    return if temp_x.nil?
    return if temp_y.nil?
    return if temp_width.nil?
    return if temp_height.nil?

    Selenium::Coordinate.new(
      x: (temp_x + (temp_width / 2)).to_i,
      y: (temp_y + (temp_height / 2)).to_i
    )
  end
end

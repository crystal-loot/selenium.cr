# I want to have seperate actions for each type (pause, pointer, key)
# but when I did that, I wasn't able to get the type union or inheritance working for some reason
class Selenium::Action
  include JSON::Serializable

  getter type : String
  getter duration : Int32?
  getter button : Int32?
  getter origin : String?
  getter x : Int32?
  getter y : Int32?

  @[JSON::Field(key: "value")]
  @_value : String?

  def initialize(
    @type,
    @duration = nil,
    value : Char? = nil,
    @button = nil,
    @origin = nil,
    @x = nil,
    @y = nil
  )
    @_value = value.try &.to_s
  end

  def value : Char?
    value.try &.char_at(0)
  end
end

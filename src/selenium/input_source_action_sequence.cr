struct Selenium::InputSourceActionSequence
  include JSON::Serializable

  getter type : String
  getter id : String
  getter actions : Array(Action)

  def initialize(@type, @id, @actions)
  end
end

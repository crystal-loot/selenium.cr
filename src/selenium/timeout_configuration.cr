class Selenium::TimeoutConfiguration
  include JSON::Serializable

  @[JSON::Field(emit_null: true)]
  getter script : Int32?

  @[JSON::Field(key: "pageLoad")]
  getter page_load : Int32?
  getter implicit : Int32?

  def initialize(@script = nil, @page_load = nil, @implicit = nil)
  end
end

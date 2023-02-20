class Selenium::Element
  getter command_handler : CommandHandler
  getter session_id : SessionId
  getter id : ElementId

  ELEMENT_KEY = "element-6066-11e4-a52e-4f735466cecf"

  def initialize(@command_handler, @session_id, @id)
  end

  def click
    command_handler.execute(:element_click, path_variables)
  end

  def submit
    script = <<-JS
      /* submitForm */ var form = arguments[0];
      while (form.nodeName != "FORM" && form.parentNode) {
        form = form.parentNode;
      }
      if (!form) { throw Error('Unable to find containing form element'); }
      if (!form.ownerDocument) { throw Error('Unable to find owning document'); }
      var e = form.ownerDocument.createEvent('Event');
      e.initEvent('submit', true, true);
      if (form.dispatchEvent(e)) { HTMLFormElement.prototype.submit.call(form) }
      JS

    args = [{ELEMENT_KEY => id}]

    parameters = {
      script: script,
      args:   args,
    }

    command_handler.execute(:execute_script, path_variables, parameters)
  rescue Selenium::Error
    raise UnsupportedOperationError.new("To submit an element, it must be nested inside a form element")
  end

  def clear
    command_handler.execute(:element_clear, path_variables)
  end

  # `attribute` is for referencing static fields
  # if you are trying to access fields that change you should use `property`
  def attribute(name)
    data = command_handler.execute(:get_element_attribute, path_variables.merge({":name" => name}))
    data["value"].as_s?
  end

  def property(name)
    data = command_handler.execute(:get_element_property, path_variables.merge({":name" => name}))
    data["value"].as_s?
  end

  def css_value(property_name)
    data = command_handler.execute(:get_element_css_value, path_variables.merge({":property_name" => property_name}))
    data["value"].as_s?
  end

  def send_keys(keys : Array(String | Symbol))
    parameters = {text: SendKeyConverter.encode(keys)}
    command_handler.execute(:element_send_keys, path_variables, parameters)
  end

  def send_keys(key : String)
    send_keys [key]
  end

  def find_child_element(using : LocationStrategy, value)
    parameters = {
      using: using,
      value: value,
    }
    data = command_handler.execute(:find_element_from_element, path_variables, parameters)
    entry = data["value"].as_h
    Element.new(command_handler, session_id, entry.first_value.as_s)
  end

  def find_child_element(using : Symbol, value)
    using, value = LocationStrategy.transform_extra_strategies(using, value)
    find_child_element(LocationStrategy.from_symbol(using), value)
  end

  def find_child_elements(using : LocationStrategy, value)
    parameters = {
      using: using,
      value: value,
    }
    data = command_handler.execute(:find_elements_from_element, path_variables, parameters)
    data["value"]
      .as_a
      .map(&.as_h.first_value.as_s)
      .map { |element_id| Element.new(command_handler, session_id, element_id) }
  end

  def find_child_elements(using : Symbol, value)
    using, value = LocationStrategy.transform_extra_strategies(using, value)
    find_child_elements(LocationStrategy.from_symbol(using), value)
  end

  def text
    data = command_handler.execute(:get_element_text, path_variables)
    data["value"].as_s
  end

  def tag_name
    data = command_handler.execute(:get_element_tag_name, path_variables)
    data["value"].as_s.downcase
  end

  def screenshot(file_path : String | File)
    data = command_handler.execute(:take_element_screenshot, path_variables)
    File.write(file_path.to_s, Base64.decode(data["value"].as_s))
  end

  def rect
    data = command_handler.execute(:get_element_rect, path_variables)

    ElementRect.from_json(data["value"].to_json)
  end

  def enabled?
    data = command_handler.execute(:is_element_enabled, path_variables)

    data["value"].as_bool
  end

  def selected?
    data = command_handler.execute(:is_element_selected, path_variables)

    data["value"].as_bool
  end

  def displayed?
    data = command_handler.execute(:is_element_displayed, path_variables)

    data["value"].as_bool
  end

  private def path_variables
    {":session_id" => session_id, ":element_id" => id.to_s}
  end
end

class Selenium::Element
  getter command_handler : CommandHandler
  getter session_id : SessionId
  getter id : ElementId

  def initialize(@command_handler, @session_id, @id)
  end

  def click
    command_handler.execute(:element_click, path_variables)
  end

  def clear
    command_handler.execute(:element_clear, path_variables)
  end

  def attribute(name)
    data = command_handler.execute(:get_element_attribute, path_variables.merge({":name" => name}))
    data["value"].as_s
  end

  def property(name)
    data = command_handler.execute(:get_element_property, path_variables.merge({":name" => name}))
    data["value"].as_s
  end

  def send_keys(keys)
    parameters = {text: SendKeyConverter.encode(keys)}.to_json
    command_handler.execute(:element_send_keys, path_variables, parameters)
  end

  def find_child_element(using, value)
    parameters = {
      using: using,
      value: value,
    }.to_json
    data = command_handler.execute(:find_element_from_element, path_variables, parameters)
    entry = data["value"].as_h
    element_id = ElementId.new(entry.first_value.as_s)
    Element.new(command_handler, session_id, element_id)
  end

  def find_child_elements(using, value)
    parameters = {
      using: using,
      value: value,
    }.to_json
    data = command_handler.execute(:find_elements_from_element, path_variables, parameters)
    data["value"]
      .as_a
      .map { |entry| ElementId.new(entry.as_h.first_value.as_s) }
      .map { |element_id| Element.new(command_handler, session_id, element_id) }
  end

  def text
    data = command_handler.execute(:get_element_text, path_variables)
    data["value"].as_s
  end

  def tag_name
    data = command_handler.execute(:get_element_tag_name, path_variables)
    data["value"].as_s
  end

  def screenshot(file_path : String | File)
    data = command_handler.execute(:take_element_screenshot, path_variables)
    File.write(file_path.to_s, Base64.decode(data["value"].as_s))
  end

  def rect
    data = command_handler.execute(:get_element_rect, path_variables)

    ElementRect.from_json(data["value"].to_json)
  end

  private def path_variables
    {":session_id" => session_id, ":element_id" => id.to_s}
  end
end

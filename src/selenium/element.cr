class Selenium::Element
  getter session : Session
  getter id : ElementId

  def initialize(@session, @id)
  end

  def click
    Command::ElementClick.new(http_client, session_id).execute(id)
  end

  def clear
    Command::ElementClear.new(http_client, session_id).execute(id)
  end

  def attribute(name)
    Command::GetElementAttribute.new(http_client, session_id).execute(id, name)
  end

  def property(name)
    Command::GetElementProperty.new(http_client, session_id).execute(id, name)
  end

  def send_keys(keys)
    Command::ElementSendKeys.new(http_client, session_id).execute(id, keys)
  end

  def find_child_element(using, value)
    element_id = Command::FindElementFromElement.new(http_client, session_id, id).execute(using, value)
    Element.new(session, element_id)
  end

  def find_child_elements(using, value)
    element_ids = Command::FindElementsFromElement.new(http_client, session_id, id).execute(using, value)
    element_ids.map { |element_id| Element.new(session, element_id) }
  end

  def text
    Command::GetElementText.new(http_client, session_id).execute(id)
  end

  private def http_client
    session.http_client
  end

  private def session_id
    session.id
  end
end

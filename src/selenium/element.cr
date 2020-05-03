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

  private def http_client
    session.http_client
  end

  private def session_id
    session.id
  end
end

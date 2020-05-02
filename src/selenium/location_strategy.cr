enum Selenium::LocationStrategy
  CSS
  LINK_TEXT
  TAG_NAME
  XPATH

  def to_json(builder)
    builder.string(convert_to_string)
  end

  private def convert_to_string
    case self
    when CSS
      "css"
    when LINK_TEXT
      "link text"
    when TAG_NAME
      "tag name"
    when XPATH
      "xpath"
    end
  end
end

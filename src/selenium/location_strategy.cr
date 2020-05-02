enum Selenium::LocationStrategy
  CSS
  LINK_TEXT
  PARTIAL_LINK_TEXT
  TAG_NAME
  XPATH

  def to_json(builder)
    builder.string(convert_to_string)
  end

  private def convert_to_string
    case self
    when CSS
      "css selector"
    when LINK_TEXT
      "link text"
    when PARTIAL_LINK_TEXT
      "partial link text"
    when TAG_NAME
      "tag name"
    when XPATH
      "xpath"
    end
  end
end

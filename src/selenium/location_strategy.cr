enum Selenium::LocationStrategy
  CSS
  LINK_TEXT
  PARTIAL_LINK_TEXT
  TAG_NAME
  XPATH

  def self.from_symbol(symbol)
    case symbol
    when :css
      CSS
    when :link_text
      LINK_TEXT
    when :partial_link_text
      PARTIAL_LINK_TEXT
    when :tag_name
      TAG_NAME
    when :xpath
      XPATH
    else
      raise ArgumentError.new
    end
  end

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

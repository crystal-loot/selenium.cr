class Selenium::Helpers::Select
  def self.from_element(element)
    tag_name = element.tag_name
    raise InvalidTagError.new(expected: "select", got: tag_name) unless tag_name == "select"

    new(element)
  end

  private getter element : Selenium::Element
  getter? multiple : Bool

  private def initialize(@element)
    multiple = element.attribute("multiple")
    @multiple = !multiple.nil? && multiple != "false"
  end

  def options
    element.find_child_elements(LocationStrategy::TAG_NAME, "option")
  end

  def selected_options
    options.select(&.selected?)
  end

  def select_by_value(value)
    select_option(find_option_by_value(value))
  end

  def deselect_by_value(value)
    deselect_option(find_option_by_value(value))
  end

  def select_all
    raise UnsupportedOperationError.new("you may only select multiple options in a multi-select") unless multiple?

    options.each { |option| select_option(option) }
  end

  def deselect_all
    raise UnsupportedOperationError.new("you may only deselect multiple options in a multi-select") unless multiple?

    options.each { |option| deselect_option(option) }
  end

  private def select_option(option)
    option.click unless option.selected?
  end

  private def deselect_option(option)
    option.click if option.selected?
  end

  private def find_option_by_value(value)
    element.find_child_element(LocationStrategy::CSS, "option[value='#{value}']")
  end
end

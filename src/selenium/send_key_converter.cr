class Selenium::SendKeyConverter
  def self.encode(keys : Array(String | Symbol)) : String
    keys.map { |key| encode(key) }.join
  end

  private def self.encode(key : String)
    key
  end

  private def self.encode(key : Symbol)
    KEYS[key]
  end

  KEYS = {
    null:             "\ue000",
    cancel:           "\ue001",
    help:             "\ue002",
    backspace:        "\ue003",
    tab:              "\ue004",
    clear:            "\ue005",
    return:           "\ue006",
    enter:            "\ue007",
    shift:            "\ue008",
    left_shift:       "\ue008",
    control:          "\ue009",
    left_control:     "\ue009",
    alt:              "\ue00A",
    left_alt:         "\ue00A",
    pause:            "\ue00B",
    escape:           "\ue00C",
    space:            "\ue00D",
    page_up:          "\ue00E",
    page_down:        "\ue00F",
    end:              "\ue010",
    home:             "\ue011",
    left:             "\ue012",
    arrow_left:       "\ue012",
    up:               "\ue013",
    arrow_up:         "\ue013",
    right:            "\ue014",
    arrow_right:      "\ue014",
    down:             "\ue015",
    arrow_down:       "\ue015",
    insert:           "\ue016",
    delete:           "\ue017",
    semicolon:        "\ue018",
    equals:           "\ue019",
    numpad0:          "\ue01A",
    numpad1:          "\ue01B",
    numpad2:          "\ue01C",
    numpad3:          "\ue01D",
    numpad4:          "\ue01E",
    numpad5:          "\ue01F",
    numpad6:          "\ue020",
    numpad7:          "\ue021",
    numpad8:          "\ue022",
    numpad9:          "\ue023",
    multiply:         "\ue024",
    add:              "\ue025",
    separator:        "\ue026",
    subtract:         "\ue027",
    decimal:          "\ue028",
    divide:           "\ue029",
    f1:               "\ue031",
    f2:               "\ue032",
    f3:               "\ue033",
    f4:               "\ue034",
    f5:               "\ue035",
    f6:               "\ue036",
    f7:               "\ue037",
    f8:               "\ue038",
    f9:               "\ue039",
    f10:              "\ue03A",
    f11:              "\ue03B",
    f12:              "\ue03C",
    meta:             "\ue03D",
    command:          "\ue03D", # alias
    left_meta:        "\ue03D", # alias
    right_shift:      "\ue050",
    right_control:    "\ue051",
    right_alt:        "\ue052",
    right_meta:       "\ue053",
    numpad_page_up:   "\ue054",
    numpad_page_down: "\ue055",
    numpad_end:       "\ue056",
    numpad_home:      "\ue057",
    numpad_left:      "\ue058",
    numpad_up:        "\ue059",
    numpad_right:     "\ue05A",
    numpad_down:      "\ue05B",
    numpad_insert:    "\ue05C",
    numpad_delete:    "\ue05D",
  }
end

require "base64"
require "json"
require "uuid"
require "uuid/json"
require "./selenium/default_commands"
require "./selenium/*"
require "./selenium/remote/**"
require "./selenium/firefox/**"
require "./selenium/chrome/**"

module Selenium
  VERSION = "0.4.0"
end

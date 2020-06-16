require "base64"
require "json"
require "uuid"
require "uuid/json"
require "./selenium/default_commands"
require "./selenium/*"
require "./selenium/remote/**"
require "./selenium/firefox/**"
require "./selenium/chrome/**"
require "./selenium/safari/**"

module Selenium
  VERSION = "0.6.0"
end

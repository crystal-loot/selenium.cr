require "base64"
require "http"
require "json"
require "socket"
require "uuid"
require "uuid/json"
require "./selenium/default_commands"
require "./selenium/*"
require "./selenium/remote/**"
require "./selenium/firefox/**"
require "./selenium/chrome/**"
require "./selenium/safari/**"
require "./selenium/helpers/**"

module Selenium
  VERSION = "0.9.0"
end

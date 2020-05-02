module Selenium::Driver::Getable
  abstract def get(path : String) : JSON::Any
end

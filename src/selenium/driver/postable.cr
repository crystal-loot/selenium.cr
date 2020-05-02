module Selenium::Driver::Postable
  abstract def post(path : String, body : String?) : String
end

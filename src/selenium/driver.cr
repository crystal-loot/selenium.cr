require "./driver/**"

module Selenium::Driver
  include Postable
  include Deleteable
  include Getable
end

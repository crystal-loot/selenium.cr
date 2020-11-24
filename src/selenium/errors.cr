module Selenium
  abstract class BaseError < Exception
  end

  class InvalidTagError < BaseError
    def initialize(expected : String, got : String)
      super "Expected tag #{expected} got #{got}."
    end
  end

  class UnsupportedOperationError < BaseError
  end
end

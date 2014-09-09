require 'after_do'
require 'logger'
require_relative 'logging/version'
require_relative 'logging/aspect'

module AfterDo
  module Logging
    @logger = Logger.new(STDOUT)

    class << self
      attr_accessor :logger
    end
  end
end

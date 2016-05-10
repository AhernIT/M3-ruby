require File.join(File.dirname(__FILE__), '..', 'vendor', 'MvxAPI.jar')
require "m3/version"
require "m3/configuration"
require "m3/query_result"
require "m3/client"

module M3
  class << self
    attr_accessor :configuration

    def configure
      self.configuration ||= Configuration.new
      yield(configuration)
    end
  end
end


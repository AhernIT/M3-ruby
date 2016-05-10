module M3
  class Configuration
    OPTIONS = [
      :uri, :username, :password, :api, :trim_whitespace
    ].freeze
    OPTIONS.each(&method(:attr_accessor))

    def initialize
      @trim_whitespace = true
    end

    def to_hash
      OPTIONS.inject({}) do |hash, option|
        hash.merge(option.to_sym => send(option))
      end
    end
  end
end

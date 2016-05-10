module M3
  class QueryResult
    def initialize(endpoint: , fields: , socket:)
      @fields = fields
      @socket = socket
      @endpoint = endpoint
      set_fields!
      access_endpoint!
    end

    def error_code
      @result
    end

    def last_error
      @socket.mvx_get_last_error
    end

    def []=(field)
      @socket.mvx_get_field(field.to_s)
    end

    private

    def set_fields!
      @fields.each_pair do |k, v|
        @socket.mvx_set_field(k.to_s, v)
      end
    end

    def access_endpoint!
      @result = @socket.mvx_access(@endpoint)
    end
  end
end

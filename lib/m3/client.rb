module M3
  java_import "MvxAPI.MvxSockJ"

  class Client

    def initialize(options = {})
      host, port = M3.configuration.uri.split(':')
      @socket = MvxSockJ.new(host, port.to_i, "", 0, "")
    end

    def connected?
      !!@connected
    end

    def connect(api = M3.configuration.api)
      i = @socket.mvx_init('LOCALA', M3.configuration.username, M3.configuration.password, api)
      @connected = i.zero?
      raise ::ConnectionNotEstablishedError, @socket.mvx_get_last_error unless connected? 
      @socket
    end

    def disconnect
      @connected = false
      @socket.mvx_close
    end

    def execute(endpoint, fields = {}, &block)
      raise ConnectionNotEstablished unless connected?

      result = M3::QueryResult.new(endpoint, fields, @socket)
      yield(result)
      disconnect
    end
  end
end

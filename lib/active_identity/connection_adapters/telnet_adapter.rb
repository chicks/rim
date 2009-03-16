require 'net/telnet'
require 'active_identity/connection_adapters/abstract_adapter'

module ActiveIdentity

  module ConnectionAdapters

    class TelnetAdapter < AbstractAdapter
      
      attr :connection, true

      def initialize(ip_address, username, password)
        @errors = Array.new
        # Build an SSH connection
        begin
          @connection = Net::Telnet::new("Host" => ip_address, "Timeout" => 5)
          @connection.login(username, password)
        rescue Timeout::Error
          @errors << "Telnet: Connection Timeout"
          return false
        rescue Errno::ECONNREFUSED
          @errors << "SSH: Connection Refused"
          return false
        rescue Errno::ECONNRESET
          @errors << "SSH: Connection Reset"
          return false
        end
      end

      def adapter_name
        'Telnet'
      end
    end

  end

end

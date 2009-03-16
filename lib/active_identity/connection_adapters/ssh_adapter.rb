require 'net/ssh'
require 'active_identity/connection_adapters/abstract_adapter'

module ActiveIdentity

  module ConnectionAdapters

    class SshAdapter < AbstractAdapter
      
      attr_reader :ssh_version
      attr        :connection, true

      def initialize(ip_address, username, password)
        @errors = Array.new
        # Build an SSH connection
        begin
          @connection = Net::SSH.start( ip_address, username, :password => password, :timeout => 5 )
          @ssh_version = @connection.transport.server_version.version
        rescue Net::SSH::HostKeyMismatch
          @errors << "SSH: Host Key Mismatch"
          return false
        rescue Net::SSH::AuthenticationFailed
          @errors << "SSH: Login Failure"
          return false
        rescue Net::SSH::Disconnect
          @errors << "SSH: Login Failure: Disconnect"
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
        'Ssh'
      end

    end
  
  end

end

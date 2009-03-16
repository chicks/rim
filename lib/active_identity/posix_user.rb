require 'active_identity/user.rb'

module ActiveIdentity

  class PosixUser < User
    attr :password, true
  end

end

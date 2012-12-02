module Iam
  module Configuration
    def configure
      yield self
    end

    mattr_accessor :account_class
    @@account_class = 'User'

    mattr_accessor :account_attributes
    @@account_attributes = ['id', 'full_name']

    mattr_accessor :role_class
    @@role_class = 'Role'

    mattr_accessor :role_attributes
    @@role_name_attribute = 'name'

    mattr_accessor :accounts_for_each_role
    @@accounts_for_each_role = 3
  end
end

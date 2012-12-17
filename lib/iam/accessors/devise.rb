module Iam
  module Accessors
    class Devise
      extend self

      def log_in(account)
        sign_in Iam::Configuration.account_class.downcase, account
      end

      def current_account?(account)
        current_user == account
      end
    end
  end
end

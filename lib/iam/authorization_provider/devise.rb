module Iam
  module AuthorizationProvider
    module Devise
      def log_in_account(account)
        sign_in Iam::Configuration[:account][:class].downcase, account
      end

      def log_out_account(account)
        sign_out account
      end

      def current_account?(account)
        current_user == account
      end
    end
  end
end

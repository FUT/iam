module Iam
  module AuthorizationProvider
    module Factory
      class << self
        def current_provider
          provider Iam::Configuration[:authorization_provider]
        end

        def provider(provider_name)
          "Iam::AuthorizationProvider::#{provider_name.camelize}".constantize
        end
      end
    end
  end
end

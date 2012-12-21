require 'rack'

require 'iam/version'
require 'iam/configuration'
require 'iam/engine' if defined?(Rails::Engine)

require 'iam/authorization_provider/factory'

require 'rack/assets_middleware'

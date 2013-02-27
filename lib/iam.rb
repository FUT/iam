require 'rack'

if File.exists?('config/iam.yml')
  require 'iam/version'
  require 'iam/configuration'
  require 'iam/engine' if defined?(Rails::Engine)

  require 'iam/authorization_provider/factory'

  require 'rack/assets_middleware'
else
  raise Exception.new("Iam config file does not exist. You may fix it with: rails g iam:initializer")
end

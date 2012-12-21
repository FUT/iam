module Iam
  class Engine < Rails::Engine
    initializer 'iam.assets.precompile' do |app|
      app.config.assets.precompile += %w(jquery.cookie.js iam.js iam.css)
    end

    initializer 'iam.assets.add_middleware' do |app|
      app.middleware.use Rack::Assets unless Rails.env.production?
    end
  end
end

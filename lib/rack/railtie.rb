module Rack
  class Railtie < ::Rails::Railtie
    initializer 'iam-assets.add_middleware' do |app|
      app.middleware.use Rack::Assets unless Rails.env.production?
    end
  end
end

module Iam
  class Engine < Rails::Engine
    initializer 'assets.precompile' do |app|
      app.config.assets.precompile += %w(jquery.cookie.js iam.js iam.css)
    end
  end
end

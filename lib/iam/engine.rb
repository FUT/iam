module Iam
  class Engine < ::Rails::Engine
    initializer :assets do |config|
      Rails.application.config.assets.precompile += %w(jquery.cookie.js iam.js iam.css)
    end
  end
end

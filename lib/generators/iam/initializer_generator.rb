module Iam
  module Generators
    class InitializerGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../../templates", __FILE__)

      desc 'Creates a sample Iam initializer.'
      def copy_initializer
        copy_file 'iam.rb', 'config/initializers/iam.rb'
      end

    end
  end
end

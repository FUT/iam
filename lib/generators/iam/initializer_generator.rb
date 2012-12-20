module Iam
  module Generators
    class InitializerGenerator < ::Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc 'Creates a sample Iam configuration.'
      def copy_initializer
        copy_file 'iam.yml', 'config/iam.yml'
      end
    end
  end
end

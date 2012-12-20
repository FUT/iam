module Iam
  module Configuration
    class << self
      def config
        @configuration ||= YAML.load(File.read 'config/iam.yml')
      end

      delegate :[], to: :config
    end
  end
end

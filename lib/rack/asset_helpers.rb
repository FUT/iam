module Rack
  module AssetHelpers
    def html_code
      @account_samples = account_samples

      css_code << js_code
    end

    private
    def css_code
      typed_asset 'stylesheets', 'iam.css'
    end

    def js_code
      typed_asset 'javascripts', 'iam.js', 'jquery.cookie.js'
    end

    def account_samples
      role_class = Iam::Configuration.role_class.constantize
      account_class = Iam::Configuration.account_class.constantize

      role_class.all.inject({}) do |account_groups, role|
        account_group = account_class.where(role_class.to_s.foreign_key => role.id).order(:id).limit(Iam::Configuration.accounts_for_each_role)
        account_groups.merge role => account_group
      end
    end

    def typed_asset(type, *files)
      files.map { |f| asset type, f }.reduce :<<
    end

    def asset(type, file)
      @assets ||= {}
      output = ::File.open(::File.join(::File.dirname(__FILE__), '..', '..', 'vendor', 'assets', type, file), 'r:UTF-8') do |f|
        f.read
      end
      @assets[file] ||= output
    end
  end
end

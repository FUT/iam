module Rack
  module AssetHelpers
    TEMPLATE = ActionView::Base.new

    def head_code
      css_code << js_code
    end

    private
    def css_code
      TEMPLATE.stylesheet_link_tag 'iam'
    end

    def js_code
      TEMPLATE.javascript_include_tag 'iam', 'jquery.cookie'
    end
  end
end

module IamHelper
  def include_iam
    return if Rails.env == 'production'

    @account_samples = account_samples
    stylesheet_link_tag('iam') +
    javascript_include_tag('iam') +
    render('iam/menu')
  end

  private
  def account_samples
    role_class = Iam::Configuration.role_class.constantize
    account_class = Iam::Configuration.account_class.constantize

    role_class.all.inject({}) do |account_groups, role|
      account_group = account_class.where(role_class.to_s.foreign_key => role.id).order(:id).limit(Iam::Configuration.accounts_for_each_role)
      account_groups.merge role => account_group
    end
  end
end

module IamHelper
  ROLE_CLASS = Iam::Configuration.role_class.constantize
  ACCOUNT_CLASS = Iam::Configuration.account_class.constantize

  def iam
    @account_samples = account_samples
    render 'iam/menu'
  end

  private
  def account_samples
    ROLE_CLASS.all.inject({}) do |account_groups, role|
      account_group = ACCOUNT_CLASS.where(ROLE_CLASS.to_s.foreign_key => role.id).order(:id).limit(Iam::Configuration.accounts_for_each_role)
      account_groups.merge role => account_group
    end
  end
end

module IamHelper
  include Iam::AuthorizationProvider::Factory.current_provider

  [:account, :role].each do |type|
    define_method "#{type}_name" do |instance|
      extract_attributes(instance, type).join ' '
    end
  end

  def extract_attributes(instance, type)
    Iam::Configuration[type][:attributes].map do |attribute|
      instance.public_send attribute
    end
  end

  def account_samples
    role_class = Iam::Configuration[:role][:class].constantize
    account_class = Iam::Configuration[:account][:class].constantize

    role_class.all.inject({}) do |account_groups, role|
      account_group = account_class.where(role_class.to_s.foreign_key => role.id).order(:id).limit(Iam::Configuration[:accounts_for_each_role])
      account_groups.merge role => account_group
    end
  end
end

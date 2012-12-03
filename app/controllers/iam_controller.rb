class IamController < ApplicationController
  def log_in_as
    account = Iam::Configuration.account_class.constantize.find(params[:id])
    sign_in Iam::Configuration.account_class.downcase, account

    name = Iam::Configuration.account_attributes.map{ |key| account.public_send(key)}.join(' ')
    render json: { notice: I18n.t('iam.success', name: name) }
  end
end

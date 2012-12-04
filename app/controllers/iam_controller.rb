class IamController < ApplicationController
  def menu; end

  def log_in_as
    return if Rail.env == 'production'

    account = Iam::Configuration.account_class.constantize.find(params[:id])
    sign_in Iam::Configuration.account_class.downcase, account

    name = Iam::Configuration.account_attributes.map{ |key| account.public_send(key)}.join(' ')
    render json: { notice: I18n.t('iam.success', name: name) }
  end
end

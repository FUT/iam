class IamController < ApplicationController
  include IamHelper
  include Iam::AuthorizationProvider::Factory.current_provider

  layout false

  def menu; end

  def log_in
    return if Rails.env == 'production'

    log_in_account account

    render json: { notice: I18n.t('iam.success', name: account_name(account)) }
  end

  private
  def account
    Iam::Configuration[:account][:class].constantize.find(params[:id])
  end
end

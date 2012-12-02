class IamController < ApplicationController
  def log_in_as
    account = Iam::Configuration.account_class.constantize.find(params[:id])
    sign_in Iam::Configuration.account_class.downcase, account
    render json: { account: account }
  end
end

class IamController < ApplicationController
  def log_in_as
    account = Iam::Configuration.account_class.constantize.find(params[:id])
    sign_in Iam::Configuration.account_class.downcase, account

    account_attributes = account.attributes.slice(*Iam::Configuration.account_attributes).values.join(' ')
    render json: { notice: "Successfully logged in as:\n#{account_attributes}" }
  end
end

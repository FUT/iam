class IamController < ApplicationController
  def log_in_as
    user = User.find(params[:id])
    sign_in :user, user
    render json: { user: user }
  end
end

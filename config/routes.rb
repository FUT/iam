Rails.application.routes.draw do
  post '/iam_you/:id', controller: :iam, action: :log_in_as, as: :log_in_as
end

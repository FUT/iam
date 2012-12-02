Rails.application.routes.draw do |map|
  match '/iam_you/:id', controller: :iam, action: :log_in_as
end

Rails.application.routes.draw do
  post 'iam/log_in/:id' => 'iam#log_in', as: :log_in
  get 'iam/menu' => 'iam#menu', as: :iam_menu
end

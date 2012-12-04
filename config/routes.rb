Rails.application.routes.draw do
  post 'iam/log_in_as/:id' => 'iam#log_in_as', as: :log_in_as
  get 'iam/menu' => 'iam#menu', as: :iam_menu
end

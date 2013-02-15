Rails.application.routes.draw do
  post 'iam/log_in/:id' => 'iam#log_in', as: :log_in
  delete 'iam/log_out/:id' => 'iam#log_out', as: :log_out
  get 'iam/menu' => 'iam#menu', as: :iam_menu
end

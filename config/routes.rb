Rails.application.routes.draw do
  devise_for :users
  root 'log_ins#index'
  resources :log_ins
end

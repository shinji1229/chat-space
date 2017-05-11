Rails.application.routes.draw do
  devise_for :users
  root 'messages#index'
  resources :groups, only: [:index, :new, :create, :edit]
end

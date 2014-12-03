Rails.application.routes.draw do
  resources :posts

  devise_for :users

  root 'pages#home'

  resources :users
end

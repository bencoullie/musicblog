Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  resources :posts

  devise_for :users

  root 'pages#home'

  resources :users
end

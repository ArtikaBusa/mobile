Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products, only: %i[index show]

  namespace :vender do
    resources :products
  end

  root to: 'home#index'
end

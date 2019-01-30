Rails.application.routes.draw do
  devise_for :sellers
  resources :sellers
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :processors
  resources :displays
  resources :colors
  resources :storages
  resources :brands
  resources :categories
  resources :products


  authenticated :seller do
     root 'products#index', as: :authenticated_root
   end

   root to: 'brands#index'
end

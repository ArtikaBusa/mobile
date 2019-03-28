Rails.application.routes.draw do
  devise_for :sellers
  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products, only: %i[index show]

  namespace :vender do
    resources :products
    resources :orders, only: %i[index show]
  end

  namespace :users do
    resources :orders, only: %i[index show destroy]
  end
  
  get '/sellers/profile', to: 'sellers#profile', as: 'seller_profile'
  get '/users/profile',   to: 'users#profile',   as: 'user_profile'

  post '/products/:id/favorite', to: 'wishlists#index', as: 'product_favorite'
  get '/favorite', to: 'wishlists#show', as: 'show_favorite'
  delete '/favorite/:id', to: 'wishlists#destroy', as: 'destroy_favorite'

  get '/products/:id/:seller_product_variant_id/order', to: 'order#index', as: 'order'
  get '/products/:id/:seller_product_variant_id/order/payment', to: 'order#payment', as: 'order_payment'
  post '/products/:id/:seller_product_variant_id/order', to: 'order#create'
  get '/products/:id/:seller_product_variant_id/order/confirm', to: 'order#confirmation', as: 'order_payment_confirm'

  root to: 'home#index'
end

Rails.application.routes.draw do

  devise_for :sellers
  devise_for :users

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :products, only: %i[index show]
  namespace :vender do
    resources :products
      get '/orders', to: 'order#index', as: 'order'
  end
  get '/orders', to: 'orders#order', as: 'order'
  get '/orders/:id', to: 'orders#show', as: 'show_order'
  delete '/orders/:id', to: 'orders#destroy', as: 'destroy_order'

  post '/products/:id/favorite', to: 'wishlists#index', as: 'product_favorite'
  get '/favorite', to: 'wishlists#show', as: 'show_favorite'
  delete '/favorite/:id', to: 'wishlists#destroy', as: 'destroy_favorite'

  get '/products/:id/:seller_product_variant_id/orders', to: 'orders#index', as: 'orders'
  get '/products/:id/:seller_product_variant_id/orders/payment', to: 'orders#payment', as: 'order_payment'
  post '/products/:id/:seller_product_variant_id/orders', to: 'orders#create'
  get '/products/:id/:seller_product_variant_id/orders/confirm', to: 'orders#confirmation', as: 'order_payment_confirm'



  root to: 'home#index'
end

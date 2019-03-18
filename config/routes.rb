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

  post '/products/:id/favorite', to: 'wishlists#index', as: 'product_favorite'
  get '/products/:id/favorite/item', to: 'wishlists#item', as: 'favorite_item'
  get '/favorite', to: 'wishlists#show', as: 'show_favorite'


  get '/products/:id/:seller_product_variant_id/orders', to: 'orders#index', as: 'orders'
  get '/products/:id/:seller_product_variant_id/orders/payment', to: 'orders#payment', as: 'order_payment'
  post '/products/:id/:seller_product_variant_id/orders', to: 'orders#create'
  get '/products/:id/:seller_product_variant_id/orders/confirm', to: 'orders#confirmation', as: 'order_payment_confirm'



  root to: 'home#index'
end

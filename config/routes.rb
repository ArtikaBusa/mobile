Rails.application.routes.draw do
  resources :processors
  resources :displays
  resources :colors
  resources :storages
  resources :brands
  resources :categories
  resources :products

  root to: "products#index"
end

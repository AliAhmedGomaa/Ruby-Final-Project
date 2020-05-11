Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :brands
  resources :categories

  get 'cart', to: 'cart#index'
  get 'checkout', to: 'checkout#index'

  get 'shop', to: 'product#index'
  get 'product/:id', to: 'product#show'
  post 'products', to: 'product#products'

  get 'order', to: 'order#index'
  post 'order', to: 'order#create'

  get 'api/shop' , to: 'api#shop'
  get 'api/product/:id' , to: 'api#product'

  root 'home#index'
end

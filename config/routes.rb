Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :brands
  resources :categories

  get 'shop', to: 'home#shop'
  get 'product', to: 'home#product'
  get 'cart', to: 'home#cart'
  get 'checkout', to: 'home#checkout'
  get 'api/shop' , to: 'api#shop'
  get '/api/product/:id' , to: 'api#product'

  root 'home#index'
end

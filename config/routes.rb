# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :products
    resources :categories
    resources :deals
    resources :customer_requests, only: [:index, :destroy]
  end
  resources :categories, only: [:show] do
    get :search, on: :member
  end
  resources :products, only: [:show]
  get 'admin', to: 'admin/products#index'
  get 'admin', to: 'admin/products#index'
  root to: 'products#index'
  get 'prducts/search', to: 'products#search'
  get 'terms_and_conditions', to: 'home#terms'
  get 'privacy', to: 'home#privacy'
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'
  get 'customer_request', to: 'home#customer_request'
  post 'submit_request', to: 'home#submit_request'
end

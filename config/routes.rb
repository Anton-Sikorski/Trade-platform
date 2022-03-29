# frozen_string_literal: true

Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_scope :user do
    get '/users/sign_up', to: 'devise/registrations#new'
    get '/users/sign_in', to: 'devise/sessions#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  devise_for :users

  root to: 'categories#index'

  get 'carts/show'
  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end

  resources :stores

  resources :categories do
    resources :products do
      resources :features
    end
  end
end

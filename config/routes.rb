# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_scope :user do
    get '/users/sign_up', to: 'devise/registrations#new'
    get '/users/sign_in', to: 'devise/sessions#new'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
  devise_for :users

  ActiveAdmin.routes(self)

  root to: 'categories#index'

  get 'carts/show'
  resource :cart, only: [:show] do
    put 'add/:movie_id', to: 'carts#add', as: :add_to
    put 'remove/:movie_id', to: 'carts#remove', as: :remove_from
  end

  resources :categories do
    resources :products do
      resources :features
    end
  end
end

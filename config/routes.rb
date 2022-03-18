# frozen_string_literal: true

Rails.application.routes.draw do
  get 'carts/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  ActiveAdmin.routes(self)

  root 'categories#index'

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

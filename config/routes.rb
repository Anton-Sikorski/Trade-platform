# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  ActiveAdmin.routes(self)

  root 'categories#index'

  resources :categories do
    resources :products do
      resources :features
    end
  end
end

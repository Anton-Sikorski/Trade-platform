# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'categories#index'

  resources :categories do
    resources :products do
      resources :features
    end
  end
end

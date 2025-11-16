# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get 'up' => 'rails/health#show', as: :rails_health_check

  namespace :mcp do
    resources :messages, only: [:create]
  end
end

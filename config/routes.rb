# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check
  # root "posts#index"

  namespace :mcp do
    resources :messages, only: [:create]
  end
end

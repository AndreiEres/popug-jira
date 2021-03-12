# frozen_string_literal: true

Rails.application.routes.draw do
  root "tasks#index"
  get "login", to: "sessions#login"
  get "logout", to: "sessions#logout"

  resources :tasks, only: %i[index edit create update destroy]
  get "current", to: "tasks#current"
end

# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
  resources :events, only: %i[index new create show]
end

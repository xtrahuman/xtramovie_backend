# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  resources :likes, only: %i[index create show]
  post 'login', to: 'authentication#login'

  get 'movie_likes', to: 'likes#movie_like'
end

# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  resources :likes, only: %i[index create show], path: 'favorites'
  resources :comments, only: %i[index create destroy]
  resources :buys, only: %i[index create]
  resources :bookmarks, only: %i[index create destroy], path: 'watchlists'
  resources :ratings, only: %i[index create destroy]
  resources :rents, only: %i[index create]
  post 'login', to: 'authentication#login'

  get 'movie_favorites', to: 'likes#movie_likes'
  get 'movie_comments', to: 'comments#movie_comments'
  get 'movie_ratings', to: 'ratings#movie_ratings'
end

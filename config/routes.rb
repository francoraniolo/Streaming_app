Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :products, only: %i[index show] do
    get 'movies', to: 'movies#index', on: :collection, as: 'movies_products'
    get 'seasons', to: 'seasons#index', on: :collection, as: 'seasons_products'
  end
  resources :movies, only: %i[index show]
  resources :seasons, only: %i[index show]
  resources :library_items, only: %i[index show]
  resources :purchases, only: [:create]
end

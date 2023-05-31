# frozen_string_literal: true

Rails.application.routes.draw do
  get 'reviews/new'
  resources :restaurants do
    # GET /restaurants/:id/reviews/new
    resources :reviews, only: %i[new create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

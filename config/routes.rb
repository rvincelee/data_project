Rails.application.routes.draw do
  root to: "home#index"

  resources :about, only: %i[index]
  resources :players, only: %i[index show]
  resources :teams, only: %i[index show]
  resources :divisions, only: %i[index show]
  resources :conferences, only: %i[index show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end

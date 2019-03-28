Rails.application.routes.draw do
  get "/openings/new/:band_id", to: "openings#new", as: "new_opening"

  resources :openings, except: :new #new has custom route (so as to pass band_id in the url params)

  resources :bands
  resources :musicians, only: [:show, :index, :edit, :update]
  resources :users, except: [:index]
  resources :requests, only: [:show, :new, :create, :index]

  get "users/suggest", to: "users#suggest", as: "suggest"
  post "/new_user", to: "users#form_1"
  get "/", to: "users#show", as: "dashboard"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end

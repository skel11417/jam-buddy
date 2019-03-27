Rails.application.routes.draw do
  resources :openings, except: :new #new has custom route (so as to pass band_id in the url params)
  get "/openings/new/:band_id", to: "openings#new", as: "new_opening"

  resources :bands
  get "/my-bands", to: "bands#index_by_user", as: "user_bands"
  resources :musicians
  resources :users, except: [:index]
  resources :requests, only: [:index, :show, :new, :create, :delete]
  get "/", to: "users#show", as: "dashboard"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end

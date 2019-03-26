Rails.application.routes.draw do
  resources :openings, except: :new #new has custom route (so as to pass band_id in the url params)
  get "/openings/new/:band_id", to: "openings#new", as: "new_opening"

  resources :bands
  resources :musicians
  resources :requests, only: [:index, :show, :new, :create, :delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

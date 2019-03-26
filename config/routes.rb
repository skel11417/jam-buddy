Rails.application.routes.draw do
  resources :bands
  resources :musicians
  resources :applications, only: [:index, :show, :new, :create, :delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

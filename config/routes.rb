Rails.application.routes.draw do
  resources :reservations, only: [:show, :create]
  resources :events, only: :show
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

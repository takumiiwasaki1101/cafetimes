Rails.application.routes.draw do
  devise_for :users
  resources :coffees, only: [:index, :new, :create, :edit, :update]
  root to: "toppages#index"
end

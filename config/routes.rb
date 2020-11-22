Rails.application.routes.draw do
  root to: "toppages#index"
  devise_for :users
  resources :coffees, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :reviews, only: [:index, :new, :create]
end

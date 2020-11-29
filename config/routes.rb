Rails.application.routes.draw do
  root to: "toppages#index"
  devise_for :users
  resources :coffees do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only:[:index]
  resources :users, only: [:index, :show]
end

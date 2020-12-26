Rails.application.routes.draw do
  root to: "toppages#index"
  devise_for :users
  resources :coffees do
    resources :reviews, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :reviews, only:[:index,:show]
  resources :users, only: [:index, :show]
end

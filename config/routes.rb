Rails.application.routes.draw do
  root to: "toppages#index"
  devise_for :users
  resources :coffees, only: [:index, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only:[:index]
end

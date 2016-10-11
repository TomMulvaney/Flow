Rails.application.routes.draw do
  root to: "sessions#login"

  post "sessions/login_attempt"

  get "signup", to: "users#new"
  get "login", to: "sessions#login"
  get "logout", to: "sessions#logout"
  get "home", to: "sessions#home"
  get "profile", to: "sessions#profile"
  get "setting", to: "sessions#setting"

  resources :tracks
  resources :users
  resources :intensities
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

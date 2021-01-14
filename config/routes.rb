Rails.application.routes.draw do
  resources :notes, only: [:index, :create, :destroy]
  resources :posts, only: [:index, :create, :destroy]
  resources :users, only: [:create]
  post "login", to: "authentication#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

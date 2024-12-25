Rails.application.routes.draw do
  root "tasks#index" # Set the root route to tasks#index

  post "/signup", to: "authentication#signup"
  post "/login", to: "authentication#login"

  resources :tasks, only: [ :index, :show, :create, :update, :destroy ]
end

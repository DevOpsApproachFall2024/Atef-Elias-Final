Rails.application.routes.draw do
  post "/signup", to: "authentication#signup"
  post "/login", to: "authentication#login"

  resources :tasks, only: [ :index, :show, :create, :update, :destroy ]
end

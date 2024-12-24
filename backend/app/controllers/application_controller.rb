class ApplicationController < ActionController::API
    def home
      render json: { message: "Welcome to the TODO App API" }
    end
  end
  
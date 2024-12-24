class AuthenticationController < ApplicationController
    SECRET_KEY = "f2bf023ae6738c19a0e686185d6a85be53afb21aab072d25f3218fbdb69bf94b0fc3f0939f25bed6e864b268929cac33a455489970293040ae479c069763bdd1"

    # Signup method
    def signup
      user = User.new(user_params)

      if user.save
        render json: { message: "User created successfully", user: user }, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
      end
    end

    # Login method
    def login
      user = User.find_by(email: params[:email])

      if user&.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        render json: { token: token, message: "Login successful" }, status: :ok
      else
        render json: { error: "Invalid email or password" }, status: :unauthorized
      end
    end

    private

    # Strong parameters
    def user_params
      params.permit(:username, :email, :password)
    end

    # JWT encoding
    def encode_token(payload)
      JWT.encode(payload, SECRET_KEY)
    end
end

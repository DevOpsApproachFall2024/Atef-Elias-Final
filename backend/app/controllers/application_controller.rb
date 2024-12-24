class ApplicationController < ActionController::API
  SECRET_KEY = "f2bf023ae6738c19a0e686185d6a85be53afb21aab072d25f3218fbdb69bf94b0fc3f0939f25bed6e864b268929cac33a455489970293040ae479c069763bdd1"

  private

  # Decodes the token and retrieves the payload
  def decode_token(token)
    JWT.decode(token, SECRET_KEY, true, algorithm: "HS256")[0]
  rescue JWT::DecodeError
    nil
  end

  # Ensures the user is authorized by verifying the token
  def authorize_request
    header = request.headers["Authorization"]
    token = header.split(" ").last if header
    decoded_token = decode_token(token)

    if decoded_token
      @current_user = User.find_by(id: decoded_token["user_id"])
      render json: { errors: "Unauthorized" }, status: :unauthorized unless @current_user
    else
      render json: { errors: "Invalid token" }, status: :unauthorized
    end
  end

  # Makes `current_user` available in other controllers
  def current_user
    @current_user
  end
end

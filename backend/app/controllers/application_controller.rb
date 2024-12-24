class ApplicationController < ActionController::API
  SECRET_KEY = "f2bf023ae6738c19a0e686185d6a85be53afb21aab072d25f3218fbdb69bf94b0fc3f0939f25bed6e864b268929cac33a455489970293040ae479c069763bdd1"

  def decode_token(token)
    JWT.decode(token, SECRET_KEY)[0] rescue nil
  end
end

class ApplicationController < ActionController::API
  private

  def token
    request.headers['Authorization']
  end
  
  def secret
    "secret"
  end

  def algorithm
    "HS256"
  end
end

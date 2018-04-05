class ApplicationController < ActionController::API
  private

  def issue_token(payload)
    JWT.encode(payload, ENV["secret"], algorithm)
  end

  def current_user
    User.find_by(id: token_user_id)
  end

  def token_user_id
    decoded_token.first['user_id']
  end

  def decoded_token
    if token
      begin
        JWT.decode(token, ENV["secret"], true, {algorithm: algorithm})
      rescue JWT::DecodeError
        return [{}]
      end
    else
      [{}]
    end
  end

  def token
    request.headers['Authorization']
  end

  def algorithm
    "HS256"
  end
end

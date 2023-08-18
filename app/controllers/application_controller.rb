# frozen_string_literal: true

class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_request!

  private

  def authenticate_request!
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    if token.blank? || !jwt_decode(token)
      render json: { error: 'unauthorized' }, status: :unauthorized
    else
      decoded = jwt_decode(token)
      if decoded.nil?
        render json: { error: 'Invalid token' }, status: :unauthorized
      else
        @current_user = User.find(decoded['user_id'])
      end
    end
  end
end

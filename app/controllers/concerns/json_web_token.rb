# frozen_string_literal: true

require "jwt"
module JsonWebToken 
    extend ActiveSupport::Concern
    SECRET_KEY = Rails.application.secret_key_base

    
    
    def jwt_encode(payload, exp=24.hours.from_now.to_i)
        payload[:exp] = exp
        JWT.encode(payload,SECRET_KEY)
    end

    def jwt_decode(token)
        decoded = JWT.decode(token, SECRET_KEY)[0]
        HashWithIndifferentAccess.new decoded
    rescue JWT::ExpiredSignature, JWT::DecodeError
        nil
    end

end
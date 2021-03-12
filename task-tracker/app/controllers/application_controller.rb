# frozen_string_literal: true

require "jwt"

class ApplicationController < ActionController::Base
  private

  SSO_URL = "http://localhost:8080/sso/super-login/"
  JWT_SECRET = "POPUG_FOREVER_ULTIMATE_SECURE"

  def current_popug
    @current_popug ||= session[:popug]
  end

  def authenticate!
    return if current_popug

    if (popug = decode_popug_token)
      session[:popug] = popug
      redirect_to root_url
    else
      redirect_to login_url
    end
  end

  def decode_popug_token
    return nil unless params[:popug_token]

    JWT.decode(params[:popug_token], JWT_SECRET, "HS256").first
  end
end

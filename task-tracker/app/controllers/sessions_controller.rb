# frozen_string_literal: true

class SessionsController < ApplicationController
  def login
    redirect_to root_path if current_popug

    @sso_url = SSO_URL
  end

  def logout
    reset_session
    redirect_to root_url
  end
end

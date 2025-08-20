# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    return if current_user

    store_location
    redirect_to login_path, alert: 'Вы гуру? Пожалуйста, проверьте свой email и пароль'
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def store_location
    session[:forwarding_url] = request.full_path if request.get?
  end
end

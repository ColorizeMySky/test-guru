# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    @user = login_user

    if @user
      session[:user_id] = user.id
      welcome_flash(@user)
      redirect_to cookies.delete(:forwarding_url) || tests_path
    else
      flash.now[:alert] = 'Вы гуру? Пожалуйста, проверьте свой email и пароль'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def login_user
    user = User.find_by(email: params[:email])
    user if user&.authenticate(params[:password])
  end

  def welcome_flash(user)
    return unless user.first_name || user.last_name

    flash[:notice] = "Привет, #{[user.first_name, user.last_name].compact.join(' ')}!"
  end
end

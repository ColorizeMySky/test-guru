class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session.delete(:forwarding_url) || tests_path
    else
      flash.now[:alert] = 'Вы гуру? Пожалуйста, проверьте свой email и пароль'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end

class UserSessionsController < ApplicationController
  layout 'authentification'

  def new
  end

  def create
    user = User.where(email: params[:email]).first
    if user
      if user.check_password(params[:password])
        session[:user_id] = user.id
        redirect_to root_path
      else
        render :new, notice: 'Password incorrect'
      end
    else
      render :new, notice: 'User not found'
    end
  end

  def destroy
    session.clear

    redirect_to new_user_session_path
  end
end

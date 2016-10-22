class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to home_path
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:info] =  "Welcome, #{user.username}!"
      redirect_to home_path
    else
      flash[:danger] = "Invalid email or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "You have been logged out! Have a fantastic day."
    redirect_to root_path
  end
end
class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, #{@user.name}!"
    else
      flash[:danger] = "I'm sorry please review your information."
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
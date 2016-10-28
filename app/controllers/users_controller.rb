class UsersController < ApplicationController
  before_filter :require_user, except: [:new, :create]

  def home
    @message = Message.new
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "We updated your info #{@user.username}."
      redirect_to edit_user_path
    else
      flash[:danger] = "I'm sorry! There was a problemo holmes!"
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, #{@user.username}!"
      redirect_to login_path
    else
      flash[:danger] = "Invalid user information. Please check the errors below."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :phone, :email, :password)
  end
end
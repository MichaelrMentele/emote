class MessagesController < ApplicationController
  before_action :require_user

  def create
    @message = Message.new(message_params.merge!(user: current_user))
    if @message.save
      flash[:success] = "#{@message.emotion} message added."
      redirect_to :back
    else  
      flash[:danger] = "Uh-oh, please check your entered information."
      render 'users/home'
    end
  end

  private

  def message_params
    params.require(:message).permit(:emoji, :message)
  end
end
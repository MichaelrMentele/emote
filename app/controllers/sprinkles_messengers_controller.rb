class SprinklesMessengersController < ApplicationController

  def show
    @message = Message.new
    @messenger = SprinklesMessenger.find(params[:id])
  end

end
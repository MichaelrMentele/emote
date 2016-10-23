class DispensersController < ApplicationController
  def new
    @dispenser = Dispenser.new
  end

  def create
    # need to implement a transaction here so if dispenser fails we rollback messenger    
    messenger = SprinklesMessenger.create(frequency: params[:frequency], period: params[:period])
    dispenser = Dispenser.new(dispenser_params.merge!(user: current_user, dispensable: messenger))
    if dispenser.save
      flash[:success] = "You're almost there! Please drag to add messages to begin sending."
      redirect_to user_sprinkles_messenger_path(user_id: current_user, id: messenger)
    else  
      messenger.destroy # cleanup
      flash[:danger] = "Please check all inputs are filled."
      render :new
    end
  end

  private

  def dispenser_params
    params.require(:dispenser).permit(:purpose_statement, :significant_id)
  end
end


class DispensersController < ApplicationController
  def new
    @message = Message.new
    @dispenser = Dispenser.new
  end
end
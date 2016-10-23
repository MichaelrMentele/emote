class SprinklesMessengersController < ApplicationController

  def show
    @message = Message.new
    @messenger = SprinklesMessenger.find(params[:id])
  end

  def update
    messenger = SprinklesMessenger.find(params[:id])

    binding.pry
    # get ids
    messages_id = params[:messages_id].map do |message_id|
      message_id.split('-').pop
    end

    # get messages
    messages = messages_id.map do |m_id|
      Message.find(m_id)
    end

    # link messages to messenger
    messenger.dispenser.messages = messages

    redirect_to :back
  end
end
class DispensersController < ApplicationController
  def new
    @message = Message.new
    @sprinkles_dispenser = SprinklesDispenser.new
    @story_dispenser = StoryDispenser.new
  end
end


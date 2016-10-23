class DispenserDecorator
  attr_reader :dispenser

  def initialize(dispenser)
    @dispenser = dispenser
  end

  def remaining_messages
    dispenser.messages.count == 1 ? s = "" : s = "s"

    "#{dispenser.messages.count} message#{s} left in message pool"
  end
end
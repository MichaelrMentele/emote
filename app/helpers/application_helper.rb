module ApplicationHelper
  def options_for_emojis(selected=nil)
    options_for_select(
      ['joy', 'love', 'hope', 'fun'], selected
    )
  end

  def options_for_dispenser_type(selected=nil)
    options_for_select(['Random Sprinkles of Affection'], selected)
  end

  def options_for_significants(significants=[], selected=nil)
    options_for_select(significants.map { |sig|
      [sig.name, sig.id]
    }, selected)
  end

  def options_for_message_frequency(selected=nil)
    options_for_select(["1", "2", "3"], selected)
  end

  def options_for_message_period(selected=nil)
    options_for_select(["1", "2", "3"], selected)
  end
end

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
    options_for_select(significants.map(&:name), selected)
  end
end

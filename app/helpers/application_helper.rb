module ApplicationHelper
  def options_for_emojis(selected=nil)
    options_for_select(
      ['joy', 'love', 'hope', 'fun'], selected
    )
  end

  def options_for_dispensers(selected=nil)
    
  end
end

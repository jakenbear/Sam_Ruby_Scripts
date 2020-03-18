class Window_CookingHelp < ASM_Window_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, width, line_number = 2)
    super(x, y, width, fitting_height(line_number))
    self.opacity = 0
    self.openness = 0
    @item = nil
  end
  #--------------------------------------------------------------------------
  # * Set Text
  #--------------------------------------------------------------------------
  def set_text(text)
    if text != @text
      @text = text
      @item = nil
      refresh
    end
  end
  #--------------------------------------------------------------------------
  # * Clear
  #--------------------------------------------------------------------------
  def clear
    set_text("")
  end
  #--------------------------------------------------------------------------
  # * Set Item
  #     item : Skills and items etc.
  #--------------------------------------------------------------------------
  def set_item(item)
    set_text(item ? item.description : "")
    if item != @item
      @item = item
      refresh
    end
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    if @item.nil?
      draw_text_ex(4, 0, @text)
    else
      draw_item_name(@item, 4, 0, true, self.width - 20)
      draw_text_ex(4, 24, @text)
    end
  end
end
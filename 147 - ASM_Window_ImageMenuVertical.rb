#==============================================================================
# ** Always Sometimes Monsters: Window_ImageMenuVertical
#------------------------------------------------------------------------------
#  This is a window class for using images as a menu
#==============================================================================

class ASM_Window_ImageMenuVertical < ASM_Window_ImageMenu
  
  def initialize(x, y, width, height, depth)
    super(x, y, width, height, depth)
  end
  
  #--------------------------------------------------------------------------#
  # * Layout Functions
  #--------------------------------------------------------------------------#
  def get_option_x(index)
    return self.x
  end
  
  def get_option_y(index)
    return self.y + (index * (60 + row_spacing))
  end
  
  #--------------------------------------------------------------------------#
  # * Cursor Functions
  #--------------------------------------------------------------------------#
  def process_cursor_move
    super
    last_index = @index
    cursor_down   if Input.repeat?(:DOWN)
    cursor_up     if Input.repeat?(:UP)
    Sound.play_cursor if @index != last_index
  end
  
  def cursor_down
    select((index + 1) % item_max)
    Input.update
  end
  
  def cursor_up
    select((index - 1) % item_max)
    Input.update
  end
  
end
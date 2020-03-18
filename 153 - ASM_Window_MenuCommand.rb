#==============================================================================
# ** Always Sometimes Monsters: Window_MenuCommand
#------------------------------------------------------------------------------
#  This is the main menu window class for ASM
#==============================================================================

class ASM_Window_MenuCommand < ASM_Window_ImageMenuVertical
  def initialize(x, y, depth)
    super(x, y, 300, 300, depth)
  end
  
  def create_options
    @options << {
      :symbol           => :items,
      :name             => "Items",
      :desc             => "Open Inventory",
      :image_normal     => "SAM_MenuOptions1_Normal",
      :image_hover      => "SAM_MenuOptions1_Hover",
      :image_disabled   => "SAM_MenuOptions1_Disabled",
      #:enabled          => true
      :enabled          => items_enabled
    }
    @options << {
      :symbol           => :save,
      :name             => "Save",
      :desc             => "Save Game",
      :image_normal     => "SAM_MenuOptions2_Normal",
      :image_hover      => "SAM_MenuOptions2_Hover",
      :image_disabled   => "SAM_MenuOptions2_Disabled",
      :enabled          => save_enabled
    }
    #REMOVED OPTIONS MENU FROM GAMEPLAY - JAR
    @options << {
      :symbol           => :options,
      :name             => "Options",
      :desc             => "Options",
      :image_normal     => "SAM_MenuOptions3_Normal",
      :image_hover      => "SAM_MenuOptions3_Hover",
      :image_disabled   => "SAM_MenuOptions3_Disabled",
      :enabled          => true
    }
    @options << {
      :symbol           => :quit,
      :name             => "Quit",
      :desc             => "Quit Game",
      :image_normal     => "SAM_MenuOptions4_Normal",
      :image_hover      => "SAM_MenuOptions4_Hover",
      :image_disabled   => "SAM_MenuOptions4_Disabled",
      :enabled          => true
    }
  end
  
  def update_help
    @help_window.set_text(@options[@index][:desc])
  end
  
  def get_option_x(index)
    return self.x - (index * (15 * ASM::graphics_width_scale))
  end
  
  def get_option_y(index)
    return self.y + (index * (90 + row_spacing))
  end
  
  def row_spacing
    return 5
  end
  
  def save_enabled
    !$game_system.save_disabled
  end  
  
  def items_enabled
  $game_variables[776] == 0
  end
  
end
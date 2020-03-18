#==============================================================================
# ** Always Sometimes Monsters: Window_TitleCommand
#------------------------------------------------------------------------------
#  This is the title menu window class for ASM
#==============================================================================

class ASM_Window_TitleCommand < ASM_Window_ImageMenuVertical
  def initialize(depth)
    width = 300
    height = 540
    x = Graphics.width - width - (25 * ASM::graphics_width_scale)
    y = 10 * ASM::graphics_height_scale
    super(x, y, width, height, depth)
    @index = 1 if continue_enabled
  end
  
  def create_options
    @options << {
      :symbol           => :newgame,
      :name             => "New Game",
      :desc             => "New Game",
      :image_normal     => "SAM_NewGame-Normal",
      :image_hover      => "SAM_NewGame-Hover",
      :image_disabled   => "SAM_NewGame-Disabled",
      :enabled          => true
    }
    @options << {
      :symbol           => :continue,
      :name             => "Continue",
      :desc             => "Continue Game",
      :image_normal     => "SAM_Continue-Normal",
      :image_hover      => "SAM_Continue-Hover",
      :image_disabled   => "SAM_Continue-Disabled",
      :enabled          => continue_enabled
    }
    @options << {
      :symbol           => :options,
      :name             => "Options",
      :desc             => "Game Options",
      :image_normal     => "SAM_Options-Normal",
      :image_hover      => "SAM_Options-Hover",
      :image_disabled   => "SAM_Options-Disabled",
      :enabled          => true
    }
    @options << {
      :symbol           => :credits,
      :name             => "Credits",
      :desc             => "Display Credits",
      :image_normal     => "SAM_Credits-Normal",
      :image_hover      => "SAM_Credits-Hover",
      :image_disabled   => "SAM_Credits-Disabled",
      :enabled          => true
    }
    @options << {
      :symbol           => :quit,
      :name             => "Quit",
      :desc             => "Quit Game",
      :image_normal     => "SAM_Quit-Normal",
      :image_hover      => "SAM_Quit-Hover",
      :image_disabled   => "SAM_Quit-Disabled",
      :enabled          => true
    }
  end
  
  def update_help
    @help_window.set_text(@options[@index][:desc])
  end
  
  def get_option_y(index)
    return self.y + (index * (90 + row_spacing))
  end
  
  def row_spacing
    return 5
  end
  
  def continue_enabled
    DataManager.save_file_exists?
  end
end
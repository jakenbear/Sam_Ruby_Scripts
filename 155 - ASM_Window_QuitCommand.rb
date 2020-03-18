#==============================================================================
# ** Always Sometimes Monsters: Window_TitleCommand
#------------------------------------------------------------------------------
#  This is the title menu window class for ASM
#==============================================================================

class ASM_Window_QuitCommand < ASM_Window_ImageMenuVertical
  def initialize(x, y, depth)
    width = 300
    height = 300
    x = (Graphics.width / 2) - ((width / 2) * ASM::graphics_width_scale)
    y = (Graphics.height / 2) - ((height / 2) * ASM::graphics_height_scale)
    super(x, y, width, height, depth)
  end
  
  def create_options
    @options << {
      :symbol           => :returngame,
      :name             => "Return to Game",
      :desc             => "Return to Game",
      :image_normal     => "QuitOption1_Normal",
      :image_hover      => "QuitOption1_Hover",
      :image_disabled   => "",
      :enabled          => true
    }
    @options << {
      :symbol           => :titlescreen,
      :name             => "Quit to Title",
      :desc             => "Quit to Title",
      :image_normal     => "QuitOption2_Normal",
      :image_hover      => "QuitOption2_Hover",
      :image_disabled   => "",
      :enabled          => true
    }
    @options << {
      :symbol           => :desktop,
      :name             => "Quit to Desktop",
      :desc             => "Quit to Desktop",
      :image_normal     => "QuitOption3_Normal",
      :image_hover      => "QuitOption3_Hover",
      :image_disabled   => "",
      :enabled          => true
    }
  end
  
  def update_help
    @help_window.set_text(@options[@index][:desc])
  end
  
  def get_option_y(index)
    return self.y + (index * (80 + row_spacing))
  end
end
#==============================================================================
# ** Always Sometimes Monsters: Window_StaminaBar
#------------------------------------------------------------------------------
#  This is the stamina bar for the main menu in ASM
#==============================================================================

class ASM_Window_StaminaBar < ASM_Window_Base
  def initialize(x, y, skipped=false, width=529, height=56, depth=5)
    super(x, y, width, height, depth)
    self.opacity = 0
    self.openness = 0
    @skipped = skipped
    create_layers
  end
  
  def update
    super
    update_animation if self.openness != 0
    update_stamina
  end
  
  #--------------------------------------------------------------------------#
  # * Create layers
  #--------------------------------------------------------------------------#
  def create_layers
    if $game_switches[1122] == false
      @stamina = "MenuStaminaBarFill" + ASM::get_stamina.to_s
      create_layer(0, "MenuStaminaBar", 0, self.x - Graphics.width, self.y)
      create_layer(1, @stamina, 0, self.x - Graphics.width, self.y)
      create_layer(2, "MenuStaminaBarOutline", 0, self.x - Graphics.width, self.y)
    else #SAM MENU NO STAMINA (transparent layers)
      @stamina = "MenuStaminaBarFill" + ASM::get_stamina.to_s
      create_layer(0, "MenuStaminaBar", 0, self.x - Graphics.width, self.y,0)
      create_layer(1, @stamina, 0, self.x - Graphics.width, self.y,0)
      create_layer(2, "MenuStaminaBarOutline", 0, self.x - Graphics.width, self.y,0)
    end  
  end
  
  #--------------------------------------------------------------------------#
  # * Update layers and step through animations
  #--------------------------------------------------------------------------#
  def update_animation
    # If skipping initial animation
    if @skipped
      get_layer(0).move(self.x, self.y, 1)
      get_layer(1).move(self.x, self.y, 1)
      get_layer(2).move(self.x, self.y, 1)
      @anim_step = 1
    end
    # Run through animation steps
    case @anim_step
    when 0
      # Slide in background
      get_layer(0).move(self.x, self.y, 200)
      get_layer(1).move(self.x, self.y, 200)
      get_layer(2).move(self.x, self.y, 200)
      @anim_step += 1
    end
  end
  
  def update_stamina
    @new_stamina = "MenuStaminaBarFill" + ASM::get_stamina.to_s
    if @new_stamina != @stamina
      @stamina = @new_stamina
      get_layer(1).set_image(@stamina)
    end
  end
end
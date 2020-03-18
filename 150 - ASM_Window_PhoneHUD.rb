#==============================================================================
# ** Always Sometimes Monsters: Window_PhoneHUD
#------------------------------------------------------------------------------
#  This is the cellphone box for the HUD in ASM
#==============================================================================

class ASM_Window_PhoneHUD < ASM_Window_Base
  def initialize(x, y, skipped=false, width=70, height=25, depth=500)
    super(x, y, width, height, depth)
    self.opacity = 0
    self.openness = 0
    @skipped = skipped
  end
  
  def update
    super
    update_phone if @anim_step >= 2
  end
  
  #--------------------------------------------------------------------------#
  # * Layer functions
  #--------------------------------------------------------------------------#
  def setup_layers
    create_layer(0, "SAM_HUDPhone_NoticeBar", 3, self.x, self.y, 0)
    create_layer(1, "SAM_HUDPhone_NoticeBar_Signal", 3, self.x, self.y, 0)
    create_layer(2, "SAM_HUDPhone_NoticeBar_Message", 3, self.x, self.y, 0)
  end
  
  #--------------------------------------------------------------------------#
  # * Animation functions
  #--------------------------------------------------------------------------#
  def setup_animations
		@anim_maxsteps = 1
	end
	
	def skip_animation
		super
    
      get_layer(0).fade(255, 1)
	end
	
	def end_animation
		super
	end
	
	def update_animation
		super
		
		case @anim_step
		when 0
      get_layer(0).fade(255, 50)
		end
	end
  
  def update_phone
    if ASM::has_phone && ASM::show_phone_hud
      get_layer(0).fade(255, 50)
      if ASM::has_phone_reception
        get_layer(1).fade(255, 50)
      else
        get_layer(1).fade(0, 50)
      end
      if ASM::has_phone_message
        get_layer(2).fade(255, 50)
      else
        get_layer(2).fade(0, 50) 
      end
    else
      get_layer(0).fade(0, 50)
      get_layer(1).fade(0, 50)
      get_layer(2).fade(0, 50)
    end
  end
end

class Scene_Map < Scene_Base
  alias asm_phone_hud_create_all_windows create_all_windows
  def create_all_windows
    asm_phone_hud_create_all_windows
    create_hud_windows
  end
  
  def create_hud_windows
 #  @phone_hud_window = ASM_Window_PhoneHUD.new(0, Graphics.height)
  end
end
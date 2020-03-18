#==============================================================================
# ** Always Sometimes Monsters: Window_PhoneBox
#------------------------------------------------------------------------------
#  This is the cellphone box for the main menu in ASM
#==============================================================================

class ASM_Window_PhoneBox < ASM_Window_Base
  def initialize(x, y, skipped=false, width=400, height=250, depth=10)
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
    create_layer(0, ASM::get_menu_phone_bg, 0, self.x, self.y - Graphics.height, 0)
    create_layer(1, ASM::get_menu_phone_case, 0, self.x, self.y - Graphics.height, 0)
    create_layer(2, "SAM_MenuPhone_NoticeBar", 0, self.x, self.y - Graphics.height, 0)
    create_layer(3, ASM::get_menu_phone_time, 0, self.x, self.y - Graphics.height, 0)
    create_layer(4, ASM::get_menu_phone_day, 0, self.x, self.y - Graphics.height, 0)
    create_layer(5, "SAM_MenuPhone_NoticeBar_Signal", 0, self.x, self.y - Graphics.height, 0)
    create_layer(6, "SAM_MenuPhone_NoticeBar_Message", 0, self.x, self.y - Graphics.height, 0)
  end
  
  #--------------------------------------------------------------------------#
  # * Animation functions
  #--------------------------------------------------------------------------#
  def setup_animations
		@anim_maxsteps = 1
	end
	
	def skip_animation
		super
    
    get_layer(0).move(self.x, self.y, 1)
    get_layer(1).move(self.x, self.y, 1)
    get_layer(2).move(self.x, self.y, 1)
    get_layer(3).move(self.x, self.y, 1)
    get_layer(4).move(self.x, self.y, 1)
    get_layer(5).move(self.x, self.y, 1)
    get_layer(6).move(self.x, self.y, 1)
	end
	
	def end_animation
		super
	end
	
	def update_animation
		super
		
		case @anim_step
		when 0
			get_layer(0).move(self.x, self.y, 200)
			get_layer(1).move(self.x, self.y, 200)
			get_layer(2).move(self.x, self.y, 200)
			get_layer(3).move(self.x, self.y, 200)
			get_layer(4).move(self.x, self.y, 200)
			get_layer(5).move(self.x, self.y, 200)
			get_layer(6).move(self.x, self.y, 200)
		end
	end
  
  def update_phone
    if ASM::has_phone
      get_layer(0).fade(255, 50)
      get_layer(1).fade(255, 50)
      get_layer(2).fade(255, 50)
      get_layer(3).fade(255, 50)
      get_layer(4).fade(255, 50)
      if ASM::has_phone_reception
        get_layer(5).fade(255, 50)
      else
        get_layer(5).fade(0, 50)
      end
      if ASM::has_phone_message
        get_layer(6).fade(255, 50)
      else
        get_layer(6).fade(0, 50)
      end
    else
      get_layer(0).fade(0, 50)
      get_layer(1).fade(0, 50)
      get_layer(2).fade(0, 50)
      get_layer(3).fade(0, 50)
      get_layer(4).fade(0, 50)
      get_layer(5).fade(0, 50)
      get_layer(6).fade(0, 50)
    end
  end
end

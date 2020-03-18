#==============================================================================
# ** Always Sometimes Monsters: Window_LocationBox
#------------------------------------------------------------------------------
#  This is the location box for the main menu in ASM
#==============================================================================

class ASM_Window_LocationBox < ASM_Window_Base
  def initialize(x, y, skipped=false, width=200, height=50, depth=7)
    super(x, y, width, height, depth)
    self.opacity = 0
    self.openness = 0
    @skipped = skipped
  end
  
  def update
    super
    update_location if @anim_step >= 2
  end
  
  #--------------------------------------------------------------------------#
  # * Layer functions
  #--------------------------------------------------------------------------#
  def setup_layers
    create_layer(0, ASM::get_location, 0, self.x + Graphics.width, self.y)
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
    get_layer(0).fade(255, 1)
	end
	
	def end_animation
		super
	end
	
	def update_animation
		super
		
		case @anim_step
		when 0
			get_layer(0).move(self.x, self.y, 200)
      get_layer(0).fade(255, 50)
		end
	end
  
  def update_location
  end
end

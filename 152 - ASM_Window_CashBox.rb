#==============================================================================
# ** Always Sometimes Monsters: Window_CashBox
#------------------------------------------------------------------------------
#  This is the cash box for the main menu in ASM
#==============================================================================

class ASM_Window_CashBox < ASM_Window_Base
  def initialize(x, y, skipped=false, width=200, height=50, depth=6)
    super(x, y, width, height, depth)
    self.opacity = 0
    self.openness = 0
    @skipped = skipped
    @digits = []
    create_digits
  end
  
  def update
    super
    update_animation if self.openness != 0
    update_digits if @anim_step >= 2
  end
  
  def refresh
    update_digits
  end
  
  #--------------------------------------------------------------------------#
  # * Layer functions
  #--------------------------------------------------------------------------#
  def setup_layers
    create_layer(0, "MenuCashBox", 0, self.x + Graphics.width, self.y)
  end
  
  def create_digits
    index = 0
    while index < 8  do
      create_layer(index + 1, "MenuDigit0", 0, self.x, self.y, 0)
      index += 1
    end
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
	end
	
	def end_animation
		super
	end
	
	def update_animation
		super
		
		case @anim_step
		when 0
			get_layer(0).move(self.x, self.y, 200)
		end
	end
  
  def update_digits
    cash = self.cash.to_s.split('')
    cashpad = Array.new(8 - cash.count)
    digits = cashpad + cash
    index = 0
    digit = 0
    while index < 8  do
      if(!digits[index].nil?)
        digit += 1
        get_layer(index + 1).set_image("MenuDigit" + digits[index])
        get_layer(index + 1).x = self.x + (digit * 20)
        get_layer(index + 1).fade(255, 50)
      else
        get_layer(index + 1).fade(0, 50)
      end
      index += 1
    end
  end
  
  #--------------------------------------------------------------------------#
  # * Utility functions
  #--------------------------------------------------------------------------#
  def cash
    $game_party.gold
  end
end
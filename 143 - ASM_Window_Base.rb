#==============================================================================
# ** Always Sometimes Monsters: Window_Base
#------------------------------------------------------------------------------
#  This is the base class all interface windows will inherit from in ASM
#==============================================================================

class ASM_Window_Base < Window_Base
  def initialize(x, y, width, height, depth=0)
    super(x, y, width, height)
    @layers = []
		@origin = 0
    @depth = depth
    @angle = 0
    @fade_time = 20
    
    @anim_step = -1
		@anim_maxsteps = 0
    @skipped = false
    
		setup_layers
		setup_animations
  end
  
  def update
    super
		update_animation if @anim_step <= @anim_maxsteps
    @layers.each do |layer|
      layer.update if !layer.nil?
      layer.set_angle(@angle) if !layer.nil?
    end
  end
  
  def dispose
    @layers.each do |layer|
      layer.dispose if !layer.nil?
    end
    super
  end
  
  def set_angle(amount)
    @angle = amount
    self.update
  end
  
  def update_open
    self.openness += (255 * ($time.delta * @fade_time))
    @opening = false if open?
    if !@layers.empty?
      @layers.each do |layer|
        layer.opacity = self.openness if !layer.nil?
      end
    end
  end
  
  def update_close
    self.openness -= (255 * ($time.delta * @fade_time))
    @closing = false if close?
    if !@layers.empty?
      @layers.each do |layer|
        layer.opacity = self.openness if !layer.nil?
      end
    end
  end
  
  #--------------------------------------------------------------------------#
  # * Layer Functions
  #--------------------------------------------------------------------------#
  #  Layers are used to create and manipulate images in the scene for
  #  interface purposes
  #--------------------------------------------------------------------------#
  def setup_layers
	end
  
  def create_layer(id, filename, origin=0, x=0, y=0, opacity=255)
    layer = ASM_Layer.new
    layer.set_image(filename)
    layer.set_origin(origin)
    layer.set_angle(@angle)
    layer.x = x
    layer.y = y
    layer.z = id + 1 + @depth
    layer.opacity = opacity
    
    @layers[id] = layer
  end
  
  def delete_layer(id)
    @layers[id].dispose
    @layers.delete_at(id)
  end
  
  def get_layer(id)
    return @layers[id]
  end
	
  #--------------------------------------------------------------------------#
  # * Animation Functions
  #--------------------------------------------------------------------------#
	def setup_animations
	end
	
	def skip_animation
		@anim_step = @anim_maxsteps
    @skipped = true
	end
	
	def end_animation
	end
		
	def update_animation
    width_scale = ASM::graphics_width_scale
    height_scale = ASM::graphics_height_scale
		
		if ASM::check_any_key
			skip_animation
			end_animation
		end
		
		@anim_step += 1
    
    if @anim_step == @anim_maxsteps
      end_animation
    end
	end
end
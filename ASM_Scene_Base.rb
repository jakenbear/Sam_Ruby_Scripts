#==============================================================================
# ** Always Sometimes Monsters: Scene_Base
#------------------------------------------------------------------------------
#  This is the base class all interface scenes will inherit from in ASM
#==============================================================================

class Scene_Base
  def start
    create_main_viewport
    
    $time = ASM_Time.new
    @layers = []
    @windows = []
    @anim_step = -1
		@anim_maxsteps = 0
    @skipped = false
		
    @depth = 0
		
		setup_layers
		setup_animations
		setup_windows
  end
  
  def update
    update_basic
    
    $time.update
		update_animation if @anim_step <= @anim_maxsteps
    @layers.each do |layer|
      layer.update if !layer.nil?
    end
    @windows.each do |window|
      window.update if !window.nil?
    end
  end
  
  def terminate
    Graphics.freeze
    dispose_all_windows
    dispose_main_viewport
    
    @layers.each do |layer|
      layer.dispose if !layer.nil?
    end
    @windows.each do |window|
      window.dispose if !window.nil?
    end
  end
  
  #--------------------------------------------------------------------------#
  # * Layer Functions
  #--------------------------------------------------------------------------#
	def setup_layers
	end
	
  def create_layer(id, filename, origin=0, x=0, y=0, opacity=255)
    layer = ASM_Layer.new
    layer.set_image(filename)
    layer.set_origin(origin)
    layer.x = x
    layer.y = y
    layer.z = id + 1 + @depth
    layer.opacity = opacity
    
    layer.zoom_x = ASM::graphics_width_scale
    layer.zoom_y = ASM::graphics_height_scale
    
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
		open_windows
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
	
  #--------------------------------------------------------------------------#
  # * Window Functions
  #--------------------------------------------------------------------------#
	def setup_windows
	end
	
	def create_window(id, window, opacity=255)
    window.z = id + 1 + @depth
    window.opacity = opacity
		window.openness = opacity
    
		@windows[id] = window
	end
	
	def open_windows
    @windows.each do |window|
      window.open if !window.nil?
      window.show if !window.nil?
    end
	end
	
	def close_windows
    @windows.each do |window|
      window.close if !window.nil?
      window.hide if !window.nil?
    end
	end
	
	def activate_window(id)
		@windows[id].activate if !@windows[id].nil?
	end
	
	def deactivate_window(id)
		@windows[id].deactivate if !@windows[id].nil?
	end
end
#==============================================================================
# ** Always Sometimes Monsters: Scene_Title
#------------------------------------------------------------------------------
#  This is the title screen scene class for ASM
#==============================================================================

class Scene_Title < Scene_Base
  def start
    super
    SceneManager.clear
    Graphics.freeze
		
    create_backdrop
    play_title_music
    #FIX FOR F12 DURING DIALOGUE
    $portrait_window = false
    portrait = ASM::get_screen.pictures[1]
    portrait.erase
    #FIX FOR F12 DURING DIALOGUE
  end
  
  def terminate
    super
		
    dispose_backdrop
  end
  
  def update
    super
		
    update_backdrop
    update_credits if @credits_roll
  end
  
  #--------------------------------------------------------------------------#
  # * Backdrop Functions
  #--------------------------------------------------------------------------#
  def create_backdrop
    # Create Viewports for Backdrop
    @viewport1 = Viewport.new
    @viewport1.z = -10
    @viewport2 = Viewport.new
    @viewport2.z = 0
    @viewport3 = Viewport.new
    @viewport3.z = 6
    
    @viewport1.tone.set(40, 30, 30, 0)
    @viewport3.tone.set(50, 30, 30, 0)
    
    # Create Parallax Layers
    @parallax = []
    @parallax[0] = ASM_Parallax.new("TitleBackgroundParallax", @viewport1, 0, 0)
    @parallax[1] = ASM_Parallax.new("TitlePinesBack", @viewport1, 1, 1)
    @parallax[2] = ASM_Parallax.new("TitlePinesMid", @viewport1, 2, 2)
    @parallax[3] = ASM_Parallax.new("TitlePinesFront", @viewport1, 3, 3)
    @parallax[4] = ASM_Parallax.new("TitleForegroundParallax", @viewport1, 6, 4)
    @parallax[5] = ASM_Parallax.new("TitlePinesTop", @viewport3, 10, 0)
    
    # Create Rain Effect
     #SAM EDIT
    @weather = Spriteset_Weather.new(@viewport2)
    @weathervain = 1 + rand(10)
    
    if @weathervain == 1
      @weather.type = :rain
      @weather.power = 7
    end
    
    if @weathervain == 2
      @weather.type = :snow
      @weather.power = 5
    end
    
    if @weathervain > 2
      @weather.type = :none
      @weather.power = 7
    end
  end
  
  def update_backdrop
    # Update Parallax scroll
    @parallax.each do |parallax|
      parallax.update if !parallax.nil?
    end
  end
  
  def dispose_backdrop
    @parallax.each do |parallax|
      parallax.dispose
    end
    
    @viewport1.dispose
    @viewport2.dispose
    @viewport3.dispose
  end
  
  #--------------------------------------------------------------------------#
  # * Layer functions
  #--------------------------------------------------------------------------#
  def setup_layers
    width_scale = ASM::graphics_width_scale
    height_scale = ASM::graphics_height_scale
    
    # Bus Art Layers
    create_layer(1, "TitleBus", 0, 0, 0, 0)
    create_layer(2, "BusWheel", 4, 509 * width_scale, 624 * height_scale, 0)
    create_layer(3, "BusWheel", 4, 552 * width_scale, 624 * height_scale, 0)
    create_layer(4, "BusWheel", 4, 812 * width_scale, 624 * height_scale, 0)
    
    # Wheel Rotation
    get_layer(2).rotate(-150)
    get_layer(3).rotate(-150)
    get_layer(4).rotate(-150)
    
    # Menu Layers
    create_layer(5, "SAM_TitleScreen_Logo", 0, 10, 10, 0)
    create_layer(20, "TitleBackground", 4, Graphics.width / 2, Graphics.height / 2, 255)
  end
  
  #--------------------------------------------------------------------------#
  # * Animation functions
  #--------------------------------------------------------------------------#
	def setup_animations
		@anim_maxsteps = 2
	end
	
	def skip_animation
		super
		
    get_layer(1).fade(255, 1)
    get_layer(2).fade(255, 1)
    get_layer(3).fade(255, 1)
    get_layer(4).fade(255, 1)
    get_layer(5).fade(255, 1)
    get_layer(20).fade(0, 1)
	end
	
	def end_animation
		super
		
		activate_window(0)
	end
	
	def update_animation
		super
		
		case @anim_step
		when 0
			get_layer(1).fade(255, 200)
			get_layer(2).fade(255, 200)
			get_layer(3).fade(255, 200)
			get_layer(4).fade(255, 200)
			get_layer(5).fade(255, 200)
		when 1
			get_layer(20).fade(0, 3000)
		end
	end
  
  #--------------------------------------------------------------------------#
  # * Window and command functions
  #--------------------------------------------------------------------------#
  def setup_windows
    width_scale = ASM::graphics_width_scale
    height_scale = ASM::graphics_height_scale
    
		window = ASM_Window_TitleCommand.new(20)
    window.set_handler(:newgame,   method(:command_new_game))
    window.set_handler(:continue,  method(:command_continue))
    window.set_handler(:options,   method(:command_options))
    window.set_handler(:credits,   method(:command_credits))
    window.set_handler(:quit,      method(:command_shutdown))
		
    create_window(0, window, 0)
    @command_window = window
  end
  
  #--------------------------------------------------------------------------
  # * [New Game] Command
  #--------------------------------------------------------------------------
  def command_new_game
    DataManager.setup_new_game
    close_command_window
    fadeout_all
    $game_map.autoplay
    SceneManager.goto(Scene_Map)
    ASM::Cooking::init_recipe_variables
  end
  
  #--------------------------------------------------------------------------
  # * [Options] Command
  #--------------------------------------------------------------------------
  def command_options
		SceneManager.call(Scene_Options)
  end
  
  #--------------------------------------------------------------------------
  # * [Credits] Command
  #--------------------------------------------------------------------------
  def command_credits
  end
  
  def update_credits
  end
end

class Game_CommonEvent
	alias sam_commonevent_update update
	def update
		if SceneManager.scene_is?(Scene_Title)
			return
		end
    
    sam_commonevent_update
  end
end

class Game_Interpreter
	alias sam_interpreter_update update
  def update
    if SceneManager.scene_is?(Scene_Title)
      Fiber.yield while SceneManager.scene_is?(Scene_Title)
		else
      sam_interpreter_update
    end
  end
end
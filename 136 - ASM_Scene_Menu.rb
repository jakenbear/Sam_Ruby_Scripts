#==============================================================================
# ** Always Sometimes Monsters: Scene_Menu
#------------------------------------------------------------------------------
#  This is the game menu scene class for ASM
#==============================================================================

class Scene_Menu < Scene_MenuBase
  def start
    super
    @last_index = 0
  end
  
  def terminate
    super
  end
  
  def update
    super
  end
  
  #--------------------------------------------------------------------------#
  # * Layer functions
  #--------------------------------------------------------------------------#
  def setup_layers    
    width_scale = ASM::graphics_width_scale
    height_scale = ASM::graphics_height_scale
    
    cx = Graphics.width / 2
    cy = Graphics.height / 2
    
    create_layer(0, "SAM_Menu_Background", 4, cx, cy, 0)
    
    x = Graphics.width
    y = Graphics.height
    
    if $game_switches[1124] == true
    #SHELLEY
    create_layer(1, "SAM_Menu_PaperRight_Shelly", 2, x * 2, y, 255)
    create_layer(5, "SAM_Menu_PortraitFade_Shelly", 2, x * 2, y, 255)
    else
        if $game_switches[2118] == false
        #PLAYER
        create_layer(1, "SAM_Menu_PaperRight", 2, x * 2, y, 255)
        create_layer(5, "SAM_Menu_PortraitFade", 2, x * 2, y, 255)  
        else
        #RIVAL
        create_layer(1, "SAM_Menu_PaperRight_Rival", 2, x * 2, y, 255)
        create_layer(5, "SAM_Menu_PortraitFade_Rival", 2, x * 2, y, 255)
        end
    end
        
    x = 0 - Graphics.width
    y = 0
    
    #BASE X OFFSET ON PORT MODE SELECTED -- JAR
    if $game_switches[2482] == false
        x_off_mc = 0;
        x_off_li = 0;
        x_layer_mc = 3;
        x_layer_li = 4;
    else
        x_off_mc = -160;
        x_off_li = 160;
        x_layer_mc = 4;
        x_layer_li = 3;
    end
    
    if $game_switches[1124] == true
    #SHELLEY
    create_layer(2, "SAM_Menu_PaperLeft_Shelly", 0, x, y, 255)
    else
        if $game_switches[2118] == false
        #PLAYER
        create_layer(2, "SAM_Menu_PaperLeft", 0, x, y, 255)
        else
        #RIVAL
        create_layer(2, "SAM_Menu_PaperLeft_Rival", 0, x, y, 255)
        end
    end
    
    x = Graphics.width - (45 * width_scale)
    y = Graphics.height - (205 * height_scale)
    
    #create_layer(3, ASM::get_mc_portrait, 2, x, y, 0) 
    create_layer(x_layer_mc, ASM::get_mc_portrait, 2, x + x_off_mc, y, 0)
    
    x = Graphics.width - (160 * width_scale)
    y = Graphics.height - (190 * height_scale)
    
    #create_layer(4, ASM::get_li_portrait, 2, x, y, 0)
    create_layer(x_layer_li, ASM::get_li_portrait, 2, x + x_off_li, y, 0)
    
    #SAM EDIT
    if $game_switches[1122] == false
      create_layer(8, "MenuTitle", 2, Graphics.width - 10, Graphics.height - 10, 0)
    else
      x = Graphics.width - (100 * width_scale)
      y = Graphics.height
      create_layer(8, "SAM_Menu_TitleLogo", 2, x, y, 0)
      end
  end
  
  #--------------------------------------------------------------------------#
  # * Animation functions
  #--------------------------------------------------------------------------#
  def setup_animations
		@anim_maxsteps = 3
	end
	
	def skip_animation
		super
		
    get_layer(0).fade(180, 1)
    get_layer(1).move(Graphics.width, Graphics.height, 1)
    get_layer(5).move(Graphics.width, Graphics.height, 1)
    get_layer(2).move(0, 0, 1)
    get_layer(3).fade(255, 1)
    get_layer(4).fade(255, 1)
    get_layer(8).fade(230, 1)
	end
	
	def end_animation
		super
		
		activate_window(0)
	end
	
	def update_animation
		super
		
		case @anim_step
		when 0
      get_layer(0).fade(180, 200)
      get_layer(1).move(Graphics.width, Graphics.height, 200)
      get_layer(5).move(Graphics.width, Graphics.height, 200)
      get_layer(2).move(0, 0, 200)
		when 1
      get_layer(3).fade(255, 200)
      get_layer(4).fade(255, 200)
		when 2
      get_layer(8).fade(230, 100)
		end
	end
  
  #--------------------------------------------------------------------------#
  # * Window and command functions
  #--------------------------------------------------------------------------#
  def setup_windows
    width_scale = ASM::graphics_width_scale
    height_scale = ASM::graphics_height_scale
    
		x = 5 * width_scale
		y = 50 * height_scale
    
    window = ASM_Window_MenuCommand.new(x, y, 20)
		window.set_angle(0)
    window.set_handler(:items,   method(:command_item))
    window.set_handler(:save,    method(:command_save))
    window.set_handler(:options, method(:command_options))
    window.set_handler(:credits, method(:command_credits))
    window.set_handler(:quit,    method(:command_game_end))
    window.set_handler(:cancel,  method(:return_scene))
    
    create_window(0, window, 0)
    @command_window = window
    
		x = Graphics.width - 200 - (60 * width_scale)
		y = 45 * height_scale
    
    window = ASM_Window_CashBox.new(x, y, @skipped)
    create_window(1, window, 0)
    
		x -= 200
		y -= 10
    
    window = ASM_Window_LocationBox.new(x, y, @skipped)
    create_window(2, window, 0)
    
		x = 0
		y = Graphics.height - (250 * height_scale)
    
    window = ASM_Window_PhoneBox.new(x, y, @skipped)
    create_window(3, window, 0)
  end
  
  #--------------------------------------------------------------------------
  # * [Item] Command
  #--------------------------------------------------------------------------
  def command_item
    SceneManager.call(Scene_Item)
  end
  #--------------------------------------------------------------------------
  # * [Save] Command
  #--------------------------------------------------------------------------
  def command_save
    SceneManager.call(Scene_Save)
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
    SceneManager.call(Scene_Credits)
  end
  #--------------------------------------------------------------------------
  # * [Exit Game] Command
  #--------------------------------------------------------------------------
  def command_game_end
    SceneManager.call(Scene_End)
  end
end
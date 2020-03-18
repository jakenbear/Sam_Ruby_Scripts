#==============================================================================
# ** Always Sometimes Monsters: Scene_Peeble
#------------------------------------------------------------------------------
#  This is the Peeble scene class for ASM
#==============================================================================

class Scene_Peeble < Scene_MenuBase
  def start
    super
    @x = 272
    @y = 105
    create_layers
    create_digits
    @peebleclose = false
    @close_step = 0
    @close_time = 0
  end
  
  def terminate
    super
  end
  
  def update
    super
    update_animation
    update_digits if @anim_step >= 2 && !@peebleclose
    check_closing if @anim_step >= 2 && !@peebleclose
    update_closing if @peebleclose
  end
  
  def check_closing
    if ASM::check_any_key
      @peebleclose = true
    end
  end
  
  def close_peeble
    return_scene
  end
  
  def create_background
    @background_sprite = Sprite.new
    @background_sprite.bitmap = SceneManager.background_bitmap
    @background_sprite.color.set(16, 16, 16, 0)
  end
  
  #--------------------------------------------------------------------------#
  # * Create layers
  #--------------------------------------------------------------------------#
  def create_layers
    @stamina = "PeebleStaminaBarFill" + ASM::get_stamina.to_s
    @time = "PeebleTime" + ASM::get_time.to_s
    create_layer(0, "PeebleBackground", 4, @x, @y, 0)
    create_layer(1, @time, 4, @x, @y, 0)
    create_layer(2, "PeebleStaminaBar", 4, @x, @y, 0)
    create_layer(3, @stamina, 4, @x, @y, 0)
    create_layer(4, "PeebleDayIcon", 4, @x, @y, 0)
    create_layer(7, "PeebleGloss", 4, @x, @y, 0)
  end
  
  def create_digits
    index = 0
    while index < 2  do
      create_layer(index + 5, "MenuDigit0", 0, (@x - 4) + (index * 21), @y + 13, 0)
      index += 1
    end
  end
  
  #--------------------------------------------------------------------------#
  # * Update layers and step through animations
  #--------------------------------------------------------------------------#
  def update_animation
    # Run through animation steps
    case @anim_step
    when 0
      # Slide in background
      get_layer(0).fade(255, 200)
      get_layer(1).fade(255, 200)
      get_layer(2).fade(255, 200)
      get_layer(3).fade(255, 200)
      get_layer(4).fade(255, 200)
      get_layer(7).fade(255, 200)
      @anim_step += 1
    when 1
      # If previous anim step has finished tweening
      if get_layer(0).fade_tween.nil? or get_layer(0).fade_tween.time >= 200
        @anim_step += 1
      end
    end
  end
  
  def update_closing
    # Fade out window and dispose
    case @close_step
    when 0
      # Slide in background
      get_layer(0).fade(0, 200)
      get_layer(1).fade(0, 200)
      get_layer(2).fade(0, 200)
      get_layer(3).fade(0, 200)
      get_layer(4).fade(0, 200)
      get_layer(5).fade(0, 200)
      get_layer(6).fade(0, 200)
      get_layer(7).fade(0, 200)
      @close_step += 1
    when 1
      # If previous anim step has finished tweening
      if get_layer(0).fade_tween.nil? or get_layer(0).fade_tween.time >= 200
        close_peeble
        @close_step += 1
      end
    end
  end
  
  def update_digits
    digits = ASM::get_day.to_s.split('')
    index = 0
    while index < 2  do
      if(!digits[index].nil?)
        get_layer(index + 5).set_image("MenuDigit" + digits[index])
        get_layer(index + 5).fade(255, 50)
      else
        get_layer(index + 5).fade(0, 50)
      end
      index += 1
    end
  end
end
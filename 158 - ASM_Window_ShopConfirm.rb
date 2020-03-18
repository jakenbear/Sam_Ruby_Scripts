#==============================================================================
# ** Always Sometimes Monsters: Window_PhoneBox
#------------------------------------------------------------------------------
#  This is the cellphone box for the main menu in ASM
#==============================================================================

class ASM_Window_ShopConfirm < ASM_Window_ImageMenu
  def initialize(x, y, skipped=false, width=760, height=500, depth=50)
    super(x, y, width, height, depth)
    @skipped = skipped
    @confirm_order = false
    @can_buy = true
    
    refresh
    
    reset_contents
  end
  
  def update
    super
    
    if @confirm_order
      get_layer(3).fade(255, 1)
    else
      get_layer(3).fade(0, 100)
    end
    
    if self.close?
      get_layer(6).fade(0, 1)
    end
  end
  
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    @options = []
    create_options
  end
  
  #--------------------------------------------------------------------------#
  # * Data functions
  #--------------------------------------------------------------------------#
  def create_options
    @options << {
      :symbol           => :ok,
      :name             => "Buy",
      :desc             => "Buy",
      :enabled          => true
    }
    @options << {
      :symbol           => :cancel,
      :name             => "Cancel",
      :desc             => "Cancel",
      :enabled          => true
    }
    
    if ASM::can_shoplift
      @options << {
        :symbol           => :steal,
        :name             => "Steal",
        :desc             => "Steal",
        :enabled          => true
      }
    end
  end
  
  def set_item(item)
    get_layer(2).set_image("SAMPIC_Shops_Item" + item.id.to_s)
  end
  
  def reset_contents
    select(0)
    @steal_check = false
    get_layer(6).fade(0, 1)
  end
  
  def item_max
    @options.length
  end
  
  def confirm_order
    @confirm_order = true
  end
  
  def cancel_order
    @confirm_order = false
    reset_contents
  end
  
  def can_buy
    return @can_buy
  end
  
  def can_buy=(can_buy)
    @can_buy = can_buy
  end
  
  #--------------------------------------------------------------------------#
  # * Cursor Functions
  #--------------------------------------------------------------------------#  
  def update_cursor
    case @index
    when 0
      get_layer(4).set_image("SAM_Shop_Confirm_Buy_Hover" + ASM::get_shop_skin)
      get_layer(5).set_image("SAM_Shop_Confirm_Cancel_Normal" + ASM::get_shop_skin)
      get_layer(6).set_image("SAM_Shop_StealClear")
    when 1
      get_layer(4).set_image("SAM_Shop_Confirm_Buy_Normal" + ASM::get_shop_skin)
      get_layer(5).set_image("SAM_Shop_Confirm_Cancel_Hover" + ASM::get_shop_skin)
      get_layer(6).set_image("SAM_Shop_StealClear")
    when 2
      get_layer(4).set_image("SAM_Shop_Confirm_Buy_Hover" + ASM::get_shop_skin)
      get_layer(5).set_image("SAM_Shop_Confirm_Cancel_Normal" + ASM::get_shop_skin)
      get_layer(6).set_image("SAM_Shop_Steal" + rand(5).to_s)
    else
      get_layer(4).set_image("SAM_Shop_Confirm_Buy_Normal" + ASM::get_shop_skin)
      get_layer(5).set_image("SAM_Shop_Confirm_Cancel_Normal" + ASM::get_shop_skin)
      get_layer(6).set_image("SAM_Shop_StealClear")
    end
  end
  
  def process_cursor_move
    return unless cursor_movable?
    last_index = @index
    cursor_steal    if Input.repeat? (:CTRL)
    cursor_right    if Input.repeat?(:RIGHT)
    cursor_left     if Input.repeat?(:LEFT)
    Sound.play_cursor if @index != last_index
  end
  
 def cursor_right
    case @index
    when 0
      select(1)
    when 1
      select(1)
    when 2
      select(1)
    end
    Input.update
  end
  
  def cursor_left    
    case @index
    when 0
      select(0)
    when 1
      select(0)
    when 2
      select(2)
    end
    Input.update
  end
  
  def cursor_steal
    case @index
    when 0
    if ASM::can_shoplift
        select(2)
    end
    when 1
    if ASM::can_shoplift
        select(2)
    end
    when 2
        select(0)        
    end
    Input.update
  end
  #--------------------------------------------------------------------------#
  # * Layer functions
  #--------------------------------------------------------------------------#
  def setup_layers
    cx = Graphics.width / 2
    cy = Graphics.height / 2
    
    x = self.x + 200
    y = self.y + 160
    
    create_layer(0, "SAM_Shop_Confirm_Background" + ASM::get_shop_skin, 4, cx, cy, 0)
    create_layer(1, "SAM_Shop_Confirm_Heading" + ASM::get_shop_skin, 4, cx, cy, 0)
    create_layer(2, "SAM_Shop_Confirm_OrderComplete" + ASM::get_shop_skin, 0, x, y, 0)
    create_layer(3, "SAM_Shop_Confirm_OrderComplete" + ASM::get_shop_skin, 4, cx, cy, 0)
    create_layer(4, "SAM_Shop_Confirm_Buy_Normal" + ASM::get_shop_skin, 4, cx, cy, 0)
    create_layer(5, "SAM_Shop_Confirm_Cancel_Normal" + ASM::get_shop_skin, 4, cx, cy, 0)
    create_layer(6, "SAM_Shop_StealClear", 4, cx, cy, 0)
    end
  
  def draw_menu_layers
  end
  
  #--------------------------------------------------------------------------#
  # * Animation functions
  #--------------------------------------------------------------------------#
  def setup_animations
		@anim_maxsteps = 1
	end
end
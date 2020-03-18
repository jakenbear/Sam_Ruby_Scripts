#==============================================================================
# ** Always Sometimes Monsters: Window_PhoneBox
#------------------------------------------------------------------------------
#  This is the cellphone box for the main menu in ASM
#==============================================================================

class ASM_Window_ShopBuy < ASM_Window_ImageMenu
  def initialize(x, y, shop_goods, skipped=false, width=760, height=500, depth=30)
    super(x, y, width, height, depth)
    @skipped = skipped
    
    @shop_goods = shop_goods
    @money = 0
    
    select(0)
    refresh
  end
  
  def update
    super
  end
  
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    @options = []
    make_item_list
    create_options
    draw_all_items
    refresh_items
  end
  
  #--------------------------------------------------------------------------#
  # * Data functions
  #--------------------------------------------------------------------------#
  def create_options
    @options << {
      :symbol           => :cancel,
      :name             => "Exit",
      :desc             => "Exit Shop",
      :id               => 0,
      :enabled          => true
    }
  end
  
  def make_item_list
    @data = []
    @price = {}
    @shop_goods.each do |goods|
      case goods[0]
      when 0;  item = $data_items[goods[1]]
      when 1;  item = $data_weapons[goods[1]]
      when 2;  item = $data_armors[goods[1]]
      end
      if item
        @data.push(item)
        @price[item] = goods[2] == 0 ? item.price : goods[3]
      end
    end
    
    @data.each do |item|
      @options << {
        :symbol           => :buy,
        :name             => item.name,
        :desc             => "Buy " + item.name,
        :id               => item.id,
        :enabled          => true
      }
    end
  end
  
  def draw_all_items
    index = 0
    depth = 8
    @data.each do |item|
      x = get_option_x(index)
      y = get_option_y(index)
      create_layer(depth + index, "SAMPIC_Shops_Item" + item.id.to_s, 0, x, y, 255)
      index += 1
    end
  end
  
  def refresh_items
    index = 0
    depth = 8
    @data.each do |item|
      if can_select_item(index)
        get_layer(depth + index).fade(255, 10)
      else
        get_layer(depth + index).fade(155, 10)
      end
      index += 1
    end
  end
  
  #--------------------------------------------------------------------------
  # * Get Item
  #--------------------------------------------------------------------------
  def item
    @data[index]
  end
  #--------------------------------------------------------------------------
  # * Get Price of Item
  #--------------------------------------------------------------------------
  def price(item)
    @price[item]
  end
  #--------------------------------------------------------------------------
  # * Set Party Gold
  #--------------------------------------------------------------------------
  def money=(money)
    @money = money
  end
  #--------------------------------------------------------------------------
  # * Get Activation State of Selection Item
  #--------------------------------------------------------------------------
  def current_item_enabled?
    enable?(@data[index])
  end
  #--------------------------------------------------------------------------
  # * Display in Enabled State?
  #--------------------------------------------------------------------------
  def enable?(item)
    item && (price(item) <= @money || ASM::can_shoplift) && !$game_party.item_max?(item)
  end
  
  #--------------------------------------------------------------------------#
  # * Cursor Functions
  #--------------------------------------------------------------------------#
  def cursor_movable?
    active && open? && !@cursor_fix && !@cursor_all && item_max > 0
  end
  
  def can_select_item(index)
    if index >= item_max
      return @options[index][:enabled]
    else
      if @data.nil?
        return false
      else
        return price(@data[index]) <= @money || ASM::can_shoplift
      end
    end
  end
  
  def process_ok
    if can_select_item(@index)
      Sound.play_ok
      Input.update
      deactivate
      call_ok_handler
    else
      Sound.play_buzzer
    end
  end
  
  def process_cursor_move
    return unless cursor_movable?
    last_index = @index
    cursor_down   if Input.repeat?(:DOWN)
    cursor_up     if Input.repeat?(:UP)
    cursor_right  if Input.repeat?(:RIGHT)
    cursor_left   if Input.repeat?(:LEFT)
    Sound.play_cursor if @index != last_index
  end
  
  def cursor_down
    if index < item_max - col_max
      select((index + col_max) % item_max)
    else
      select((index + 1) % index_max)
    end
    Input.update
  end
  
  def cursor_up
    if index >= col_max
      select((index - col_max + item_max) % item_max)
    else
      select((index - 1) % index_max)
    end
    Input.update
  end
  
  def cursor_right
    if col_max >= 2 && (index < item_max - 1)
      select((index + 1) % item_max)
    end
    Input.update
  end
  
  def cursor_left
    if col_max >= 2 && (index > 0)
      select((index - 1 + item_max) % item_max)
    end
    Input.update
  end
  
  #--------------------------------------------------------------------------#
  # * Layout functions
  #--------------------------------------------------------------------------#  
  def get_option_x(index)
    return self.x + (index % col_max * (350 + row_spacing))
  end
  
  def get_option_y(index)
    return self.y + 145 + (index / col_max * 50)
  end
  
  def col_max
    2
  end
  
  def row_max
    [(item_max + col_max - 1) / col_max, 1].max
  end
  
  def row_spacing
    10
  end
  
  def item_max
    @data ? @data.size : 0
  end
  
  def index_max
    @options.length
  end
  
  #--------------------------------------------------------------------------#
  # * Cursor Functions
  #--------------------------------------------------------------------------#
  def update_cursor
    if @index >= item_max
      get_layer(7).fade(0, 50)
      
      if @index == (item_max)
        get_layer(5).set_image("SAM_Shop_Exit_Hover" + ASM::get_shop_skin)
      else
        get_layer(5).set_image("SAM_Shop_Exit_Normal" + ASM::get_shop_skin)
      end
    else
      get_layer(5).set_image("SAM_Shop_Exit_Normal" + ASM::get_shop_skin)
      
      x = get_option_x(index)
      y = get_option_y(index)
      
      get_layer(7).move(x, y, 10)
      get_layer(7).fade(255, 50)
      
      if can_select_item(@index)
        get_layer(7).fade(255, 10)
      else
        get_layer(7).fade(200, 10)
      end
    end
  end
  
  #--------------------------------------------------------------------------#
  # * Layer functions
  #--------------------------------------------------------------------------#
  def setup_layers
    cx = Graphics.width / 2
    cy = Graphics.height / 2
    
		x = self.x
		y = self.y - 32
    
    create_layer(0, "SAM_Shop_Background" + ASM::get_shop_skin, 4, cx, cy, 0)
    create_layer(1, ASM::get_store_logo + ASM::get_shop_skin, 0, x, y, 0)
    create_layer(2, "SAM_Shop_Logo_Border" + ASM::get_shop_skin, 4, cx, cy, 0)
    create_layer(3, "SAM_Shop_Boxes_Background" + ASM::get_shop_skin, 4, cx, cy, 0)
    create_layer(4, "SAM_Shop_Boxes_Border" + ASM::get_shop_skin, 4, cx, cy, 0)
    create_layer(5, "SAM_Shop_Exit_Normal" + ASM::get_shop_skin, 4, cx, cy, 0)
    
    x = self.x + 360
    y = self.y + 5
    
    create_layer(7, "SAM_Shop_ItemHighlight" + ASM::get_shop_skin, 0, 0, 0, 0)
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
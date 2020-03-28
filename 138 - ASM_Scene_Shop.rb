#==============================================================================
# ** Always Sometimes Monsters: Scene_Shop
#------------------------------------------------------------------------------
#  This is the shop menu scene class for ASM
#==============================================================================

class Scene_Shop < Scene_MenuBase
  
  #CREATE OUR PACK to ITEMS LIST HERE
  #Format: Pack_Item => [Item_it_Becomes, How_Many]
  P_LIST = 
    {
    510=>[539,12],
    566=>[565,6],
    568=>[567,6],
    570=>[569,6],
    572=>[571,6],
    573=>[565,12],
    574=>[567,12],
    575=>[569,12],
    576=>[571,12]
    }
  #END PACK ITEM LIST
  
  def start
    @shop_window = nil
    @buy_window = nil
    @item = nil
    super
  end
  
  def terminate
    super
  end
  
  def update
    super
    
    @shop_window.money = money
    @shop_window.refresh_items
  end
  
  #--------------------------------------------------------------------------#
  # * Layer functions
  #--------------------------------------------------------------------------#
  def setup_layers
  end
  
  #--------------------------------------------------------------------------#
  # * Animation functions
  #--------------------------------------------------------------------------#
  def setup_animations
		@anim_maxsteps = 1
	end
	
	def skip_animation
		super
	end
	
	def end_animation
    @shop_window.open
    @shop_window.show
    
    @shop_window.activate
	end
	
	def update_animation
		super
	end
  
  #--------------------------------------------------------------------------#
  # * Window and command functions
  #--------------------------------------------------------------------------#
  def setup_windows
    width_scale = ASM::graphics_width_scale
    height_scale = ASM::graphics_height_scale
    
		x = 285 * width_scale
		y = 130 * height_scale
    
    @shop_window = ASM_Window_ShopBuy.new(x, y, @goods)
    @shop_window.set_handler(:buy,      method(:command_buy))
    @shop_window.set_handler(:cancel,   method(:return_scene))
    
    create_window(0, @shop_window, 0)
    
		x = 270 * width_scale
		y = 140 * height_scale
    
    @buy_window = ASM_Window_ShopConfirm.new(x, y)
    @buy_window.set_handler(:ok,     method(:on_buy_ok))
    @buy_window.set_handler(:cancel, method(:on_buy_cancel))
    @buy_window.set_handler(:steal, method(:on_buy_steal))
    
    create_window(1, @buy_window, 0)
  end
  
  #--------------------------------------------------------------------------
  # * [Buy] Command
  #--------------------------------------------------------------------------
  def command_buy
    @item = @shop_window.item
    activate_buy_window
  end
  
  #--------------------------------------------------------------------------
  # * Activate Purchase Window
  #--------------------------------------------------------------------------
  def activate_buy_window
    @buy_window.set_item(@item)
    @buy_window.can_buy = (self.buying_price <= self.money)
    @buy_window.cancel_order
    @buy_window.open
    @buy_window.show
    @buy_window.reset_contents
    @buy_window.activate
  end
  
  #--------------------------------------------------------------------------
  # * Buy [OK]
  #--------------------------------------------------------------------------
  def on_buy_ok
    if @buy_window.can_buy
      @buy_window.confirm_order
      Audio.se_play("Audio/SE/SAMAUDIO_CashRegister", 65, 100)
      case @shop_window.current_symbol
      when :buy
        do_buy(1)
      end
      on_buy_cancel
    else
      Sound.play_buzzer
      ASM::fail_shop_transaction
      return_scene
    end
  end
  
  #--------------------------------------------------------------------------
  # * Buy [Cancel]
  #--------------------------------------------------------------------------
  def on_buy_cancel
    @shop_window.refresh_items
    @shop_window.activate
    @buy_window.cancel_order
    @buy_window.hide
    @buy_window.close
    @buy_window.reset_contents
  end
  
  #--------------------------------------------------------------------------
  # * Buy [Steal]
  #--------------------------------------------------------------------------
  def on_buy_steal
    @buy_window.confirm_order
    Audio.se_play("Audio/SE/SAMAUDIO_Steal1", 85, 100)
    case @shop_window.current_symbol
    when :buy
      do_steal(1)
    end
    on_buy_cancel
  end
  
  #--------------------------------------------------------------------------
  # * Execute Steal
  #--------------------------------------------------------------------------
  def do_steal(number)
    $game_party.gain_item(@item, number)
    ASM::set_shoplifter(true)
    ASM::set_goods_in_pocket(true)
    ASM::increase_shoplifting_risk(number)
  end
  
  #--------------------------------------------------------------------------
  # * Execute Purchase
  #--------------------------------------------------------------------------
  def do_buy(number)
    self.lose_money(number * buying_price)
    if P_LIST.key?(@item.id)
      #Pack Item purchase
      new_item = P_LIST[@item.id][0] 
      new_number = P_LIST[@item.id][1] 
      p "Bought Item: " + @item.id.to_s + " Got => +" +
         new_number.to_s + " Item: " +  new_item.to_s
      new_item = P_LIST[@item.id][0] 
      new_number = P_LIST[@item.id][1] 
      $game_party.gain_item($data_items[new_item], new_number)
    else
      #Regular purchase
      p "Regular Purchase +1 Item: " + @item.id.to_s 
      $game_party.gain_item(@item, number) 
    end
  end
  
  #--------------------------------------------------------------------------
  # * Get Party Gold
  #--------------------------------------------------------------------------
  def money
    if ASM::cash_mode
      $game_party.gold
    else
      $game_variables[965]
    end
  end
  
  def lose_money(amount)
    if ASM::cash_mode
      $game_party.lose_gold(amount)
    else
      $game_variables[965] -= (amount)
    end
  end
  
  #--------------------------------------------------------------------------
  # * Get Purchase Price
  #--------------------------------------------------------------------------
  def buying_price
    @shop_window.price(@item)
  end
end
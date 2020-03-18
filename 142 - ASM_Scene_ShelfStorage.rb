#==============================================================================
# ** Always Sometimes Monsters: Scene_Storage
#------------------------------------------------------------------------------
#  This is the storage menu scene class
#==============================================================================

class Scene_ShelfStorage < Scene_MenuBase
  #--------------------------------------------------------------------------
  # * Start Processing
  #--------------------------------------------------------------------------
  def start
    super
    create_help_window
    create_item_window
    create_command_window
    activate_item_window
    @item_window.select(0)
  end
  #--------------------------------------------------------------------------
  # * Get Currently Selected Item
  #--------------------------------------------------------------------------
  def item
    @item_window.item
  end
  def mode
    @item_window.mode
  end
  #--------------------------------------------------------------------------
  # * Activate Item Window
  #--------------------------------------------------------------------------
  def activate_item_window
    @item_window.refresh
    @item_window.open
    @item_window.activate
  end
  def activate_command_window
    @command_window.select_item = item
    @command_window.refresh
    @command_window.open
    @command_window.activate
  end
  #--------------------------------------------------------------------------
  # * Create Command Window
  #--------------------------------------------------------------------------
  def create_command_window
    x = 420 #(Graphics.width/ 2) - 150
    y = 100 + @help_window.height
    width = 300
    height = 200
    @command_window = Window_ShelfStorageCommand.new(x, y, width, height, 70)
    @command_window.viewport = @viewport
    #@command_window.help_window = @help_window
    @command_window.set_handler(:ok,     method(:on_command_ok))
    @command_window.set_handler(:cancel, method(:on_command_cancel))
  end
  #--------------------------------------------------------------------------
  # * Create Help Window
  #--------------------------------------------------------------------------
  def create_help_window
    x = 100 #(Graphics.width / 2) - 150
    y = 100
    width = 300
    @help_window = Window_ShelfStorageHelp.new(x, y, width, 3)
    @help_window.viewport = @viewport
    @help_window.open
  end
  #--------------------------------------------------------------------------
  # * Create Item Window
  #--------------------------------------------------------------------------
  def create_item_window
    x = 100 #(Graphics.width/ 2) - 150
    y = 100 + @help_window.height
    width = 300
    height = Graphics.height - 200 - @help_window.height
    @item_window = Window_ShelfStorageList.new(x, y, width, height, 60)
    @item_window.viewport = @viewport
    @item_window.help_window = @help_window
    @item_window.set_handler(:ok,     method(:on_item_ok))
    @item_window.set_handler(:cancel, method(:on_item_cancel))
    @item_window.open
  end
  #--------------------------------------------------------------------------
  # * Item [OK]
  #--------------------------------------------------------------------------
  def on_item_ok
    if item == 0
      on_item_cancel
    elsif item == 1 && mode == 0
      @item_window.mode = 1
      activate_item_window
      @item_window.select(0)
    elsif item.is_a?(RPG::Item)
      @command_window.mode = mode
      activate_command_window
      @command_window.select(0)
    end
  end
  #--------------------------------------------------------------------------
  # * Item [Cancel]
  #--------------------------------------------------------------------------
  def on_item_cancel
    if mode == 0
      close_storage
    elsif mode == 1
      @item_window.mode = 0
      activate_item_window
      @item_window.select(0)
    end
  end
  #--------------------------------------------------------------------------
  # * Command [OK]
  #--------------------------------------------------------------------------
  def on_command_ok
    if @command_window.item == 0
      on_command_cancel
    elsif @command_window.item == 1
      index = ASM::ShelfStorage::get_storage_index
      amount = 1
      ASM::ShelfStorage::modify_item_amount(index, item.id, -amount)
      $game_party.gain_item(item, amount)
      on_command_cancel
    elsif @command_window.item == 2
      index = ASM::ShelfStorage::get_storage_index
      amount = ASM::ShelfStorage::get_item_amount(index, item.id)
      ASM::ShelfStorage::modify_item_amount(index, item.id, -amount)
      $game_party.gain_item(item, amount)
      on_command_cancel
    elsif @command_window.item == 3
      index = ASM::ShelfStorage::get_storage_index
      amount = 1
      ASM::ShelfStorage::modify_item_amount(index, item.id, amount)
      $game_party.lose_item(item, amount)
      on_command_cancel
    elsif @command_window.item == 4
      index = ASM::ShelfStorage::get_storage_index
      amount = $game_party.item_number(item)
      if amount > ASM::ShelfStorage::storage_item_space(index, item.id)
        amount = ASM::ShelfStorage::storage_item_space(index, item.id)
      end
      ASM::ShelfStorage::modify_item_amount(index, item.id, amount)
      $game_party.lose_item(item, amount)
      on_command_cancel
    end
  end
  #--------------------------------------------------------------------------
  # * Command[Cancel]
  #--------------------------------------------------------------------------
  def on_command_cancel
    @command_window.close
    activate_item_window
  end
  
  def close_storage
    @item_window.unselect
    @item_window.close
    @help_window.close
    return_scene
  end
end
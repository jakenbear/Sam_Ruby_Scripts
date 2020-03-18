class Window_ShelfStorageCommand < ASM_Window_Selectable
  attr_accessor :mode
  attr_accessor :select_item
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height, depth=0)
    super
    @mode = 0
    @select_item = nil
  end
  
  def update
    super
    @layers.each do |layer|
      layer.update if !layer.nil?
    end
  end
  
  def dispose
    @layers.each do |layer|
      layer.dispose if !layer.nil?
    end
    super
  end
  
  #--------------------------------------------------------------------------#
  # * Layer Functions
  #--------------------------------------------------------------------------#
  #  Layers are used to create and manipulate images in the scene for
  #  interface purposes
  #--------------------------------------------------------------------------#
  def setup_layers
    x = self.x - 12
    y = self.y - 12
    create_layer(0, "SAM-storage-background", 0, x, y, self.openness)
	end
  #--------------------------------------------------------------------------
  # * Create Item List
  #--------------------------------------------------------------------------
  def make_item_list
    @data = Array.new
    if @mode == 0
      @data.push(1)
      @data.push(2)
      @data.push(0)
    elsif @mode == 1
      @data.push(3)
      @data.push(4)
      @data.push(0)
    end
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    change_color(normal_color, enable?(item))
    if item == 0
      rect = item_rect(index)
      rect.x += 4
      draw_text(rect, "Cancel")
    elsif item == 1
      rect = item_rect(index)
      rect.x += 4
      draw_text(rect, "Take One")
    elsif item == 2
      rect = item_rect(index)
      rect.x += 4
      draw_text(rect, "Take All")
    elsif item == 3
      rect = item_rect(index)
      rect.x += 4
      draw_text(rect, "Add One")
    elsif item == 4
      rect = item_rect(index)
      rect.x += 4
      draw_text(rect, "Add All")
    end
  end
  #--------------------------------------------------------------------------
  # * Update Help Text
  #--------------------------------------------------------------------------
  def update_help
    if item == 0
      @help_window.set_text("Cancel")
    elsif item == 1
      @help_window.set_text("Take One")
    elsif item == 2
      @help_window.set_text("Take All")
    elsif item == 3
      @help_window.set_text("Add One")
    elsif item == 4
      @help_window.set_text("Add All")
    end
  end
  #--------------------------------------------------------------------------
  # * Display in Enabled State?
  #--------------------------------------------------------------------------
  def enable?(item)
    if item == 0
      return true
    elsif item == 1
      return true
    elsif item == 2
      quantity = ASM::ShelfStorage::get_item_amount(ASM::ShelfStorage::get_storage_index, @select_item.id)
      return quantity > 1
    elsif item == 3
      return true
    elsif item == 4
      quantity = $game_party.item_number(@select_item)
      return quantity > 1
    end
  end
  
  
  #--------------------------------------------------------------------------
  # * Move Cursor Down
  #--------------------------------------------------------------------------
  def cursor_down(wrap = false)
    if index < item_max - col_max || (wrap && col_max == 1)
      select((index + col_max) % item_max)
      if index == 1 && !enable?(item)
        select((index + col_max) % item_max)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Move Cursor Up
  #--------------------------------------------------------------------------
  def cursor_up(wrap = false)
    if index >= col_max || (wrap && col_max == 1)
      select((index - col_max + item_max) % item_max)
      if index == 1 && !enable?(item)
        select((index - col_max + item_max) % item_max)
      end
    end
  end

  #--------------------------------------------------------------------------
  # * Get Activation State of Selection Item
  #--------------------------------------------------------------------------
  def current_item_enabled?
    return enable?(item)
  end
end


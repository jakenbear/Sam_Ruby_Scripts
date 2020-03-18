class Window_ShelfStorageList < ASM_Window_Selectable
  attr_accessor :mode
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height, depth=0)
    super
    @mode = 0
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
    x = self.x - 24
    y = self.y - 117
    create_layer(0, "SAM-ingredient-background", 0, x, y, self.openness)
	end
  #--------------------------------------------------------------------------
  # * Include in Item List?
  #--------------------------------------------------------------------------
  def include?(item)
    if item.nil?
      return false
    end
    if item.is_a?(RPG::Item) && !item.key_item? && ASM::ShelfStorage::storable(item)
      return true
    elsif item == 0 || item == 1
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Display in Enabled State?
  #--------------------------------------------------------------------------
  def enable?(item)
    if item == 0
      return true
    elsif item == 1
      return !ASM::ShelfStorage::storage_full(ASM::ShelfStorage::get_storage_index)
    elsif item.is_a?(RPG::Item)
      if mode == 0
        return true
      elsif mode == 1
        return !ASM::ShelfStorage::storage_item_full(ASM::ShelfStorage::get_storage_index, item.id)
      end
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Create Item List
  #--------------------------------------------------------------------------
  def make_item_list
    if @mode == 0
      @data = ASM::ShelfStorage::get_storage_items(ASM::ShelfStorage::get_storage_index).select {|item| include?(item) }
      @data.push(1) if include?(1)
      @data.push(0) if include?(0)
    elsif @mode == 1
      @data = $game_party.all_items.select {|item| include?(item) }
      @data.push(0) if include?(0)
    end
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    change_color(normal_color, enable?(item))
    if item.is_a?(RPG::Item)
      rect = item_rect(index)
      rect.width -= 4
      draw_item_name(item, rect.x, rect.y, enable?(item))
      draw_item_number(rect, item)
    elsif item == 0
      rect = item_rect(index)
      rect.x += 4
      if @mode == 0
        draw_text(rect, ASM::ShelfStorage::storage_close_prompt(ASM::ShelfStorage::get_storage_index))
      elsif @mode == 1
        draw_text(rect, ASM::ShelfStorage::storage_return_prompt(ASM::ShelfStorage::get_storage_index))
      end
    elsif item == 1
      rect = item_rect(index)
      rect.x += 4
      draw_text(rect, ASM::ShelfStorage::storage_add_prompt(ASM::ShelfStorage::get_storage_index))
    end
  end
  #--------------------------------------------------------------------------
  # * Update Help Text
  #--------------------------------------------------------------------------
  def update_help
    if item.is_a?(RPG::Item)
      @help_window.set_item(item)
    elsif item == 0
      if @mode == 0
        @help_window.set_text(ASM::ShelfStorage::storage_close_help(ASM::ShelfStorage::get_storage_index))
      elsif @mode == 1
        @help_window.set_text(ASM::ShelfStorage::storage_return_help(ASM::ShelfStorage::get_storage_index))
      end
    elsif item == 1
      @help_window.set_text(ASM::ShelfStorage::storage_add_help(ASM::ShelfStorage::get_storage_index))
    end
  end
  #--------------------------------------------------------------------------
  # * Draw Number of Items
  #--------------------------------------------------------------------------
  def draw_item_number(rect, item)
    if @mode == 0
      draw_text(rect, sprintf("x%2d", ASM::ShelfStorage::get_item_amount(ASM::ShelfStorage::get_storage_index, item.id)), 2)
    elsif @mode == 1
      draw_text(rect, sprintf("x%2d", $game_party.item_number(item)), 2)
    end
  end
end
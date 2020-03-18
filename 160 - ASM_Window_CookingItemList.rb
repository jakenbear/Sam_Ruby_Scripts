class Window_CookingItemList < ASM_Window_Selectable
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height, depth=0)
    super
    @category = 0
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
  # * Set Category
  #--------------------------------------------------------------------------
  def category=(category)
    return if @category == category
    @category = category
    refresh
    self.oy = 0
  end
  #--------------------------------------------------------------------------
  # * Include in Item List?
  #--------------------------------------------------------------------------
  def include?(item)
    if item.nil?
      return true
    end
    ingredients = ASM::Cooking::get_ingredients(@category)
    return ingredients.include?(item.id)
  end
  #--------------------------------------------------------------------------
  # * Create Item List
  #--------------------------------------------------------------------------
  def make_item_list
    @data = $game_party.all_items.select {|item| include?(item) }
    @data.push(nil) if include?(nil)
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index)
    item = @data[index]
    if item
      rect = item_rect(index)
      rect.width -= 4
      draw_item_name(item, rect.x, rect.y, enable?(item))
      draw_item_number(rect, item)
    else
      rect = item_rect(index)
      rect.x += 4
      draw_text(rect, "None")
    end
  end
  #--------------------------------------------------------------------------
  # * Update Help Text
  #--------------------------------------------------------------------------
  def update_help
    if item
      @help_window.set_item(item)
    else
      @help_window.set_text("Clear this ingredient slot")
    end
  end
end
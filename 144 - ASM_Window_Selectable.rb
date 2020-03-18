class ASM_Window_Selectable < Window_Selectable
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height, depth=0)
    super(x, y, width, height)
    self.opacity = 0
    self.openness = 0
    @layers = []
		@origin = 0
    @depth = depth
    @angle = 0
    @fade_time = 20
    
		setup_layers
    
    @data = []
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
  
  def set_angle(amount)
    @angle = amount
    self.update
  end
  
  def update_open
    self.openness += (255 * ($time.delta * @fade_time))
    @opening = false if open?
    if !@layers.empty?
      @layers.each do |layer|
        layer.opacity = self.openness if !layer.nil?
      end
    end
  end
  
  def update_close
    self.openness -= (255 * ($time.delta * @fade_time))
    @closing = false if close?
    if !@layers.empty?
      @layers.each do |layer|
        layer.opacity = self.openness if !layer.nil?
      end
    end
  end
  
  #--------------------------------------------------------------------------#
  # * Layer Functions
  #--------------------------------------------------------------------------#
  #  Layers are used to create and manipulate images in the scene for
  #  interface purposes
  #--------------------------------------------------------------------------#
  def setup_layers
	end
  
  def create_layer(id, filename, origin=0, x=0, y=0, opacity=255)
    layer = ASM_Layer.new
    layer.set_image(filename)
    layer.set_origin(origin)
    layer.set_angle(@angle)
    layer.x = x
    layer.y = y
    layer.z = id + 1 + @depth
    layer.opacity = opacity
    
    @layers[id] = layer
  end
  
  def delete_layer(id)
    @layers[id].dispose
    @layers.delete_at(id)
  end
  
  def get_layer(id)
    return @layers[id]
  end
  
  #--------------------------------------------------------------------------
  # * Get Digit Count
  #--------------------------------------------------------------------------
  def col_max
    return 1
  end
  #--------------------------------------------------------------------------
  # * Get Number of Items
  #--------------------------------------------------------------------------
  def item_max
    @data ? @data.size : 1
  end
  #--------------------------------------------------------------------------
  # * Get Item
  #--------------------------------------------------------------------------
  def item
    @data && index >= 0 ? @data[index] : nil
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
    true
  end
  #--------------------------------------------------------------------------
  # * Create Item List
  #--------------------------------------------------------------------------
  def make_item_list
  end
  #--------------------------------------------------------------------------
  # * Restore Previous Selection Position
  #--------------------------------------------------------------------------
  def select_last
    select(0)
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
    end
  end
  #--------------------------------------------------------------------------
  # * Draw Number of Items
  #--------------------------------------------------------------------------
  def draw_item_number(rect, item)
    draw_text(rect, sprintf("x%2d", $game_party.item_number(item)), 2)
  end
  #--------------------------------------------------------------------------
  # * Update Help Text
  #--------------------------------------------------------------------------
  def update_help
    if item
      @help_window.set_item(item)
    end
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    make_item_list
    create_contents
    draw_all_items
  end
end
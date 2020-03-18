#==============================================================================
# ** Always Sometimes Monsters: Window_MenuBase
#------------------------------------------------------------------------------
#  This is the base command window
#==============================================================================

class ASM_Window_MenuBase < ASM_Window_Base
  attr_reader   :command                  # is command window?
  attr_reader   :index                    # cursor position
  attr_accessor :cursor_fix               # fix cursor flag
  attr_accessor :cursor_all               # select all cursors flag
  
  def initialize(x, y, width, height, depth)
    super(x, y, width, height, depth)
    self.opacity = 0
    self.openness = 0
    @index = -1
    @options = []
    @handler = {}
    @cursor_fix = false
    @cursor_all = false
    create_options
    create_contents
    draw_menu_layers
    deactivate
    @command = true
    @fade_time = 20
  end
  
  def update
    super
    process_cursor_move
    process_handling
    update_menu
  end
  
  #--------------------------------------------------------------------------#
  # * Variable Functions
  #--------------------------------------------------------------------------#
  def activate
    super
    select(0) if @index == -1
  end
  
  def active=(active)
    super
    update_cursor
    call_update_help
  end
    
  def index=(index)
    @index = index
    update_cursor
    call_update_help
  end
  
  def select(index)
    self.index = index if index
  end
  
  #--------------------------------------------------------------------------#
  # * Option List Functions
  #--------------------------------------------------------------------------#
  def create_options
    @options.clear
  end
  
  def add_option(id, symbol, name, desc, image, x, y, width, height, slot, enabled=true)
    @options[id] = {
      :symbol           => symbol,
      :name             => name,
      :desc             => desc,
      :image            => image,
      :x                => x,
      :y                => y,
      :width            => width,
      :height           => height,
      :slot             => slot,
      :enabled          => enabled
    }
  end
  
  def remove_option(id)
    @options[id] = nil
  end
  
  #--------------------------------------------------------------------------#
  # * Layer functions
  #--------------------------------------------------------------------------#
  def setup_layers
    x = self.x
    y = self.y
    create_layer(0, menu_background_image, 0, x, y, 0)
    create_layer(1, menu_highlight_image, 0, 0, 0, 0)
  end
  
  #--------------------------------------------------------------------------#
  # * Menu Display Functions
  #--------------------------------------------------------------------------#
  def refresh
    contents.clear
    create_options
    create_contents
		update_menu_layers
  end
  
  def full_refresh
    get_layer(0).set_image(menu_background_image)
    clear_menu_layers
    contents.clear
    create_options
    create_contents
    draw_menu_layers
  end
  
  def menu_option_rect(option, x=-1, y=-1, width=-1, height=-1)
    rect = Rect.new
    rect.x = (x >= 0) ? x : option[:x]
    rect.y = (y >= 0) ? y : option[:y]
    rect.width = (width >= 0) ? width : option[:width]
    rect.height = (height >= 0) ? height : option[:height]
    return rect
  end
  
  def draw_menu_layers
    if !@options.empty?
      @options.each_with_index do |option, index|
        image = option[:image]
        if (image == "")
          draw_menu_option(option, index)
        else
          x = option[:x] + self.x
          y = option[:y] + self.y
          create_layer(index + menu_index_offset, image, 0, x, y, self.openness)
        end
      end
    end
  end
	
	def update_menu_layers
    if !@options.empty?
      @options.each_with_index do |option, index|
        image = option[:image]
        if (image == "")
          draw_menu_option(option, index)
        end
      end
    end
	end
  
  def clear_menu_layers
    if !@options.empty?
      @options.each_with_index do |option, index|
        image = option[:image]
        if (image != "")
          layer_num = index + menu_index_offset
          layer = get_layer(layer_num)
          layer.dispose if !layer.nil?
          @layers[layer_num] = nil
        end
      end
    end
  end
	
	def menu_image_alpha(index)
		return (command_enabled?(index)) ? 255 : 150
	end
  
  def update_menu
    if !@options.empty?
      @options.each_with_index do |option, index|
        image = option[:image]
        if (image != "")
          layer = get_layer(index + menu_index_offset)
          if (self.openness <= menu_image_alpha(index))
            layer.fade(self.openness, 1)
          else
            layer.fade(menu_image_alpha(index), 1)
          end
        end
      end
    end
  end
  
  def draw_menu_option(option, index)
    reset_font_settings
    change_color(normal_color, command_enabled?(index))
  end
  
  def update_open
    self.openness += (255 * ($time.delta * @fade_time))
    @opening = false if open?
    if !@layers.empty?
      @layers.each do |layer|
        layer.fade(self.openness, 1) if !layer.nil?
      end
    end
  end
  
  def update_close
    self.openness -= (255 * ($time.delta * @fade_time))
    @closing = false if close?
    if !@layers.empty?
      @layers.each do |layer|
        layer.fade(self.openness, 1) if !layer.nil?
      end
    end
  end
  
  #--------------------------------------------------------------------------#
  # * Layout Functions
  #--------------------------------------------------------------------------#
  def contents_width
    width
  end
  
  def contents_height
    height
  end
  
  def line_height
    return 30
  end
  
  def standard_padding
    return 0
  end
  
  def menu_index_offset
    2
  end
  
  def menu_background_image
    "SAM-cooking-background"
  end
	
	def menu_highlight_image
		"SAM-cooking-highlight"
	end
  
  def item_max
    return @options.length
  end
  
  #--------------------------------------------------------------------------#
  # * Cursor Functions
  #--------------------------------------------------------------------------#
  def cursor_movable?
    active && open? && item_max > 0
  end
  
  def process_cursor_move
    return unless cursor_movable?
    last_index = @index
    cursor_down   if Input.repeat?(:DOWN)
    cursor_up     if Input.repeat?(:UP)
    cursor_left   if Input.repeat?(:LEFT)
    cursor_right  if Input.repeat?(:RIGHT)
    Sound.play_cursor if @index != last_index
  end
  
  def cursor_down
    select((index + 1) % item_max)
    Input.update
  end
  
  def cursor_up
    select((index - 1) % item_max)
    Input.update
  end
  
  def cursor_left
    Input.update
  end
  
  def cursor_right
    Input.update
  end
  
  def update_cursor
    if (!@layers.empty? && (!@options.empty? && active))
			if @index >= 0
          x = @options[@index][:x] + self.x
          y = @options[@index][:y] + self.y
          get_layer(1).move(x, y, 1)
          get_layer(1).set_base_width(@options[@index][:width])
          get_layer(1).set_base_height(@options[@index][:height])
          get_layer(1).fade(200, 1)
			end
    end
    
    if (!@layers.empty? && (@options.empty? || !active))
      get_layer(1).fade(0, 1)
    end
  end
  
  #--------------------------------------------------------------------------#
  # * Method Handler Functions
  #--------------------------------------------------------------------------#
  def set_handler(symbol, method)
    @handler[symbol] = method
  end
  
  def handle?(symbol)
    @handler.include?(symbol)
  end
  
  def call_handler(symbol)
    @handler[symbol].call if handle?(symbol)
  end
  
  def current_symbol
    return @options[@index][:symbol]
  end
  
  def process_handling
    return unless open? && active
    return process_ok       if ok_enabled?        && Input.trigger?(:C)
    return process_cancel   if cancel_enabled?    && Input.trigger?(:B)
  end
  
  def ok_enabled?
    return true
  end
  
  def cancel_enabled?
    handle?(:cancel)
  end
  
  def command_enabled?(index)
    return @options[index][:enabled]
  end
  
  def current_item_enabled?
    return @options[@index][:enabled]
  end
  
  def process_ok
    if current_item_enabled?
      Sound.play_ok
      Input.update
      #deactivate
      call_ok_handler
    else
      Sound.play_buzzer
    end
  end
  
  def call_ok_handler
    if handle?(current_symbol)
      call_handler(current_symbol)
    elsif handle?(:ok)
      super
    else
      activate
    end
  end
  
  def process_cancel
    Sound.play_cancel
    Input.update
    deactivate
    call_cancel_handler
  end
  
  def call_cancel_handler
    call_handler(:cancel)
  end
  
  #--------------------------------------------------------------------------#
  # * Help Window Functions
  #--------------------------------------------------------------------------#
  def help_window=(help_window)
    @help_window = help_window
    call_update_help
  end
  
  def call_update_help
    update_help if active && @help_window
  end
  
  def update_help
    @help_window.clear
  end
end
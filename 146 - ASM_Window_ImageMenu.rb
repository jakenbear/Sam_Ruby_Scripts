#==============================================================================
# ** Always Sometimes Monsters: Window_ImageMenu
#------------------------------------------------------------------------------
#  This is a window class for using images as a menu
#==============================================================================

class ASM_Window_ImageMenu < ASM_Window_Base
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
    draw_menu_layers if !@options.empty?
    deactivate
    @command = true
    @fade_time = 20
  end
  
  def update
    super
    process_cursor_move
    process_handling
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
  end
  
  def add_option(id, symbol, name, desc, image_normal, image_hover=nil, image_disabled=nil, enabled=true)
    @options[id] = {
      :symbol           => symbol,
      :name             => name,
      :desc             => desc,
      :image_normal     => image_normal,
      :image_hover      => image_hover,
      :image_disabled   => image_disabled,
      :enabled          => enabled
    }
  end
  
  def remove_option(id)
    @options[id] = nil
  end
  
  #--------------------------------------------------------------------------#
  # * Menu Display Functions
  #--------------------------------------------------------------------------#
  def draw_menu_layers
    if !@options.empty?
      @options.each_with_index do |option, index|
        image = option[:image_normal]
        if !option[:enabled] && !option[:image_disabled].nil?
          image = option[:image_disabled]
        end
        x = get_option_x(index)
        y = get_option_y(index)
        create_layer(index, image, 0, x, y, self.openness)
      end
    end
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
  # * Layout Functions
  #--------------------------------------------------------------------------#
  def col_spacing
    return 32
  end
  
  def row_spacing
    return 8
  end
  
  def get_option_x(index)
    return self.x
  end
  
  def get_option_y(index)
    return self.y + (index * (60 + row_spacing))
  end
  
  def col_max
    return 1
  end
  
  def item_max
    return @options.length
  end
  
  #--------------------------------------------------------------------------#
  # * Cursor Functions
  #--------------------------------------------------------------------------#
  def cursor_movable?
    active && open? && !@cursor_fix && !@cursor_all && item_max > 0
  end
  
  def process_cursor_move
    return unless cursor_movable?
  end
  
  def update_cursor
    if !@layers.empty?
      @layers.each_with_index do |layer, index|
        if @options[index][:enabled]
          layer.set_image(((index == @index || @cursor_all) && active) ? @options[index][:image_hover] : @options[index][:image_normal])
        else
          if (index == @index || @cursor_all) && active
            layer.tone = Tone.new(50, 50, 50)
          else
            layer.tone = Tone.new(0, 0, 0)
          end
        end
      end
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
    return handle?(:ok) || @command
  end
  
  def cancel_enabled?
    handle?(:cancel)
  end
  
  def current_item_enabled?
    return @options[@index][:enabled]
  end
  
  def process_ok
    if current_item_enabled?
      Sound.play_ok
      Input.update
      deactivate
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
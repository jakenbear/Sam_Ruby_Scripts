class Game_Interpreter  
  def process_message_window
    $portrait_window = true
    
    # Code to process message box images and make sure they are
    # displayed in the correct location and scale
    portrait = ASM::get_screen.pictures[1]
    
    # Determine coordinates for pictures
    x = $game_variables[127] #xpos
    y = $game_variables[128] #ypos
    
    image_name = portrait.name
    
    # Next line is for debug purposes, as this is the only
    # current 1280x720 asset for testing with, remove later - Iko
    #image_name = "SAMPORT_F003-HD"
    
    # Establish scaling for portrait window
    if !ASM::global_pic_scale
      zoom_x = 100 * ASM::graphics_width_scale
      zoom_y = 100 * ASM::graphics_height_scale
    else
      zoom_x = 100
      zoom_y = 100
    end
    
    portrait.show(image_name, 0, x, y,
      zoom_x, zoom_y, 255, 0)
  end
    
  def close_message_window
    $portrait_window = false
    
    # Code to close message box images
    portrait = ASM::get_screen.pictures[1]
    portrait.erase
  end
end

class Window_Base < Window
  def window_scale    
    factor = 1.5
    if $portrait_window
      return (factor * ASM::graphics_height_scale)
    else
      return 1
    end
  end
  
  def sam_char_width(ch = "A")
    text_size(ch).width 
  end
  
  def sam_get_length(index)
    length = 5
    index.times {|i| length += (char_width(@name[i]) + 5)}
    return length
  end
  
  def line_height
    return 24 * window_scale
  end
  
  def standard_padding
    return 12 * window_scale
  end
  
  alias :sam_window_message_reset_font_settings :reset_font_settings
  def reset_font_settings
    sam_window_message_reset_font_settings
    
    if $portrait_window
      contents.font.size = Font.default_size * window_scale
    end
  end
end

class Window_Message < Window_Base
  def open
    if $portrait_window
      self.x = 40 * ASM::graphics_width_scale
      self.y = Graphics.height - (220 * ASM::graphics_height_scale)
      self.width = 1200 * ASM::graphics_width_scale
      self.height = 180 * ASM::graphics_height_scale
      create_contents
    end
    
    super
  end
  
  alias :sam_window_message_window_height :window_height
  def window_height
    if $portrait_window
      #do stuff!
      return 180 * ASM::graphics_height_scale
    else
      return sam_window_message_window_height
    end
  end
  
  alias :sam_window_message_update_placement :update_placement
  def update_placement
    sam_window_message_update_placement
    
    if $portrait_window
      @gold_window.update_placement
    end
  end
end

class Window_Gold < Window_Base
  def update_placement
    if $portrait_window
      self.width = 250 * ASM::graphics_width_scale
      self.height = 65 * ASM::graphics_height_scale
      self.x = Graphics.width - width - (40 * ASM::graphics_width_scale)
      self.y = 20 * ASM::graphics_height_scale
      create_contents
    end
  end
  
  def standard_padding
    return 12 * window_scale
  end
  
  def draw_text(*args)
    if $portrait_window
      contents.font.size = Font.default_size * window_scale
    end
    
    super(*args)
  end
end

class Window_NumberInput < Window_Base
  alias :sam_window_message_number_update_placement :update_placement
  def update_placement
    sam_window_message_number_update_placement
    
    if $portrait_window
      self.width = (@digits_max * (20 * window_scale) + padding * 2) + (4 * ASM::graphics_height_scale)
      self.height = fitting_height(1) + (6 * ASM::graphics_height_scale)
      self.x = (Graphics.width - width) / 2
      self.y = @message_window.y - height - (50 * ASM::graphics_height_scale)
    end
  end
  
  def draw_text(*args)
    if $portrait_window
      contents.font.size = Font.default_size * window_scale
    end
    
    super(*args)
  end
  
  def item_rect(index)
    Rect.new(index * (20 * window_scale), 0, 20 * window_scale, line_height * window_scale)
  end
end

class Window_ChoiceList < Window_Command
  alias :sam_window_message_choice_update_placement :update_placement
  def update_placement
    sam_window_message_choice_update_placement
    
    if $portrait_window
      self.width = ([max_choice_width + 12, 96].max + padding * 2) * window_scale
      self.width = [width, Graphics.width].min
      self.height = fitting_height($game_message.choices.size)
      self.x = Graphics.width - width - (40 * ASM::graphics_width_scale)
      self.y = @message_window.y - height - (20 * ASM::graphics_height_scale)
    end
  end
  
  def draw_text(*args)
    if $portrait_window
      contents.font.size = Font.default_size * window_scale
    end
    
    super(*args)
  end
end
#==============================================================================
# ** Always Sometimes Monsters: Window_CookingMenu
#------------------------------------------------------------------------------
#  This is the main command window for the cooking system
#==============================================================================

class ASM_Window_CookingMenu < ASM_Window_MenuBase
  attr_reader   :ingredients
  
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height, depth)
    @ingredients = [nil, nil, nil, nil]
    super(x, y, width, height, depth)
  end
  
  #--------------------------------------------------------------------------#
  # * Option List Functions
  #--------------------------------------------------------------------------#
  def create_options
    super
    x = 45
    y = 45
    @options << {
      :symbol           => :recipebook,
      :name             => "Recipe Book",
      :desc             => "Open Recipe Book",
      :image            => "",
      :x                => x,
      :y                => y,
      :width            => 260,
      :height           => 30,
      :slot             => -1,
      :enabled          => true
    }
    y += 41
    @options << {
      :symbol           => :baseitem,
      :name             => "Base Ingredient",
      :desc             => "Add Base Ingredient",
      :image            => "",
      :x                => x,
      :y                => y,
      :width            => 260,
      :height           => 30,
      :slot             => 0,
      :enabled          => ingredient_available(0, 1)
    }
    y += 31
    @options << {
      :symbol           => :extraitem1,
      :name             => "Extra Ingredient",
      :desc             => "Add Extra Ingredient",
      :image            => "",
      :x                => x,
      :y                => y,
      :width            => 260,
      :height           => 30,
      :slot             => 1,
      :enabled          => ingredient_available(1, 2)
    }
    y += 31
    @options << {
      :symbol           => :extraitem2,
      :name             => "Extra Ingredient",
      :desc             => "Add Extra Ingredient",
      :image            => "",
      :x                => x,
      :y                => y,
      :width            => 260,
      :height           => 30,
      :slot             => 2,
      :enabled          => ingredient_available(2, 2)
    }
    y += 31
    @options << {
      :symbol           => :spice,
      :name             => "Spice",
      :desc             => "Add Spice",
      :image            => "",
      :x                => x,
      :y                => y,
      :width            => 260,
      :height           => 30,
      :slot             => 3,
      :enabled          => ingredient_available(3, 3)
    }
    y += 41
    @options << {
      :symbol           => :cook,
      :name             => "Cook",
      :desc             => "Cook",
      :image            => "SAM-cooking-button-cook",
      :x                => x,
      :y                => y,
      :width            => 120,
      :height           => 30,
      :slot             => -1,
      :enabled          => can_cook
    }
    x += 145
    @options << {
      :symbol           => :cancel,
      :name             => "Cancel",
      :desc             => "Cancel",
      :image            => "SAM-cooking-button-cancel",
      :x                => x,
      :y                => y,
      :width            => 120,
      :height           => 30,
      :slot             => -1,
      :enabled          => true
    }
  end
  
  def return_ingredient(slot=-1)
    if slot >= 0
      if @ingredients[slot] != nil
        $game_party.gain_item(@ingredients[slot], 1)
        @ingredients[slot] = nil
      end
    end
  end
  
  def return_ingredients
    if @ingredients[0] != nil
      $game_party.gain_item(@ingredients[0], 1)
    end
    if @ingredients[1] != nil
      $game_party.gain_item(@ingredients[1], 1)
    end
    if @ingredients[2] != nil
      $game_party.gain_item(@ingredients[2], 1)
    end
    if @ingredients[3] != nil
      $game_party.gain_item(@ingredients[3], 1)
    end
  end
  
  def ingredient_empty?(index)
    return @ingredients[index].nil?
  end
  
  def update_ingredient(item)
    if item
      $game_party.lose_item(item, 1)
    end
    @ingredients[@options[index][:slot]] = item
    refresh
  end
  
  def ingredient_available(index, type=0)
    items = $game_party.all_items.select {|item| include?(item, type) }
    items.push(nil) if include?(nil)
    return !items.empty? || !ingredient_empty?(index)
  end
  
  def include?(item, type=0)
    if item.nil?
      return false
    end
    ingredients = ASM::Cooking::get_ingredients(type)
    return ingredients.include?(item.id)
  end
  
  def can_cook
    return (@ingredients[0] != nil)
  end
  
  #--------------------------------------------------------------------------#
  # * Layer functions
  #--------------------------------------------------------------------------#
  def setup_layers
    super
    x = self.x + 45
    y = self.y + 86
    create_layer(2, "SAM-cooking-icon-question", 0, x, y, 0)
    create_layer(3, "SAM-cooking-icon-question", 0, x, y + 31, 0)
    create_layer(4, "SAM-cooking-icon-question", 0, x, y + 62, 0)
    create_layer(5, "SAM-cooking-icon-question", 0, x, y + 93, 0)
  end
  
  #--------------------------------------------------------------------------#
  # * Menu Display Functions
  #--------------------------------------------------------------------------#  
  def draw_menu_option(option, index)
    super
    x = option[:x] + 2
    y = option[:y] + 2
    text = option[:name]
    
    if (option[:symbol] == :recipebook)
      # show recipe book icon
      draw_icon(368, x, y)
      x += 30
    end
    
    if (option[:slot] >= 0)
      ingredient = @ingredients[option[:slot]]
      if (ingredient != nil)
        # draw item icon
        draw_icon(ingredient.icon_index, x, y)
        # set menu name
        text = ingredient.name
        # hide ? icon
        get_layer(2 + option[:slot]).fade(0, 1)
      else
        # show ? icon
        get_layer(2 + option[:slot]).fade(255, 1)
      end
      x += 30
    end
    
    draw_text(menu_option_rect(option, x, y), text)
  end
  
  #--------------------------------------------------------------------------
  # * Layout Options
  #--------------------------------------------------------------------------
  def menu_index_offset
    6
  end
  
  def menu_background_image
    "SAM-cooking-background"
  end
  
  #--------------------------------------------------------------------------#
  # * Cursor Functions
  #--------------------------------------------------------------------------#
  def update_cursor
    super
  end
  
  def cursor_down
    super
  end
  
  def cursor_up
    if (!@ingredients[0].nil? && @index == 0)
      select(6)
    end
    super
  end
  
  def cursor_left
    if (@index == 6)
      select(5)
    end
    super
  end
  
  def cursor_right
    if (@index == 5)
      select(6)
    end
    super
  end
end
#==============================================================================
# ** Always Sometimes Monsters: Window_RecipeBook
#------------------------------------------------------------------------------
#  This is the recipe book window for the cooking system
#==============================================================================

# TODO: Fix error when going back to recipe category list!

class ASM_Window_RecipeBook < ASM_Window_MenuBase
  
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(x, y, width, height, depth)
    @category_select = false
    @current_category = -1
    @recipe_index = 0
    @current_recipe = -1
    @recipes = []
    @known_recipes = ASM::Cooking::get_known_recipes
    @recipes_per_page = 4
    super(x, y, width, height, depth)
  end
  
  def set_start_index
    if @category_select
      select(2)
    else
      select(1)
    end
  end
  
  #--------------------------------------------------------------------------#
  # * Option List Functions
  #--------------------------------------------------------------------------#
  def create_options
    super
    if @category_select
      create_recipe_options
    else
      create_category_options
    end
  end
  
  def create_category_options
    x = 50
    y = 35
    @options << {
      :symbol           => :close_book,
      :name             => "Close",
      :desc             => "Close Recipe Book",
      :image            => "SAM-recipe-button-close",
      :x                => x + 230,
      :y                => y,
      :width            => 30,
      :height           => 30,
      :slot             => -1,
      :enabled          => true
    }
    y += 51
    
    categories = ASM::Cooking::get_categories    
    if !categories.empty?
      categories.each_with_index do |category, index|
        @options << {
          :symbol           => :set_category,
          :name             => category[1],
          :desc             => "Show " + category[1] + " Recipes",
          :image            => "",
          :x                => x,
          :y                => y,
          :width            => 260,
          :height           => 30,
          :slot             => index,
          :enabled          => true
        }
        y += 31
      end
    end
  end
  
  def create_recipe_options
    x = 50
    y = 35
    @options << {
      :symbol           => :close_book,
      :name             => "Close",
      :desc             => "Close Recipe Book",
      :image            => "SAM-recipe-button-close",
      :x                => x + 230,
      :y                => y,
      :width            => 30,
      :height           => 30,
      :slot             => -1,
      :enabled          => true
    }
    y += 41
    @options << {
      :symbol           => :go_back,
      :name             => "Back to Categories",
      :desc             => "Back to Categories",
      :image            => "",
      :x                => x,
      :y                => y,
      :width            => 260,
      :height           => 30,
      :slot             => -1,
      :enabled          => true
    }
    y += 31
    @options << {
      :symbol           => :scroll_up,
      :name             => "Scroll Up",
      :desc             => "Scroll Up",
      :image            => "SAM-recipe-arrow-up",
      :x                => x,
      :y                => y,
      :width            => 260,
      :height           => 30,
      :slot             => -1,
      :enabled          => can_scroll_up
    }
    y += 31
    @options << {
      :symbol           => :recipe,
      :name             => "Recipe",
      :desc             => "Recipe",
      :image            => "",
      :x                => x,
      :y                => y,
      :width            => 260,
      :height           => 30,
      :slot             => 0,
      :enabled          => has_recipe_in_slot(0)
    }
    y += 31
    @options << {
      :symbol           => :recipe,
      :name             => "Recipe",
      :desc             => "Recipe",
      :image            => "",
      :x                => x,
      :y                => y,
      :width            => 260,
      :height           => 30,
      :slot             => 1,
      :enabled          => has_recipe_in_slot(1)
    }
    y += 31
    @options << {
      :symbol           => :recipe,
      :name             => "Recipe",
      :desc             => "Recipe",
      :image            => "",
      :x                => x,
      :y                => y,
      :width            => 260,
      :height           => 30,
      :slot             => 2,
      :enabled          => has_recipe_in_slot(2)
    }
    y += 31
    @options << {
      :symbol           => :recipe,
      :name             => "Recipe",
      :desc             => "Recipe",
      :image            => "",
      :x                => x,
      :y                => y,
      :width            => 260,
      :height           => 30,
      :slot             => 3,
      :enabled          => has_recipe_in_slot(3)
    }
    y += 31
    @options << {
      :symbol           => :scroll_down,
      :name             => "Scroll Down",
      :desc             => "Scroll Down",
      :image            => "SAM-recipe-arrow-down",
      :x                => x,
      :y                => y,
      :width            => 260,
      :height           => 30,
      :slot             => -1,
      :enabled          => can_scroll_down
    }
  end
  
  def can_scroll_up
    return @recipe_index > 0
  end
  
  def can_scroll_down
    return (@recipe_index + @recipes_per_page) < @recipes.count
  end
  
  def recipe_exists(index)
    if index >= @recipes.count
      return false
    else
      return true
    end
  end
  
  def has_recipe_in_slot(slot)
    index = slot + @recipe_index
    if recipe_exists(index)
      return has_recipe_index(@recipes[index][0])
    else
      return false
    end
  end
  
   def has_recipe_index(index)
    if ASM::Cooking::unlock_recipes
      return true
    end
    if index >= @known_recipes.count
      return false
    else
      return @known_recipes[index]
    end
  end
  
  def set_recipe
    index = @options[@index][:slot] + @recipe_index
    @current_recipe = index
    refresh
  end
  
  def set_recipe_index(index)
    @recipe_index = index
    refresh
  end
  
  def scroll_up
    @recipe_index -= @recipes_per_page
    if @recipe_index < 0
      @recipe_index = 0
    end
    refresh
  end
  
  def scroll_down
    @recipe_index += @recipes_per_page
    if @recipe_index >= @recipes.count
      @recipe_index = @recipes.count - 1
    end
    refresh
  end
  
  def show_categories
    @category_select = false
    @current_recipe = -1
    full_refresh
    set_recipe_index(0)
    if @current_category >= 0
      select(@current_category + 1)
    else
      select(@current_category + 2)
    end
  end
  
  def set_category
    @current_category = @options[index][:slot]
    @category_select = true
    update_recipes
    full_refresh
    set_recipe_index(0)
    @current_recipe = -1
    select(2)
  end
  
  def update_recipes
    @recipes.clear
    book = ASM::Cooking::get_recipe_book
    book.each_with_index do |recipe, index|
      if recipe[5] == @current_category
        @recipes.push([index, recipe])
      end
    end
  end
  
  #--------------------------------------------------------------------------#
  # * Cursor Functions
  #--------------------------------------------------------------------------#
  def cursor_down
    if @category_select && index == 7
      scroll_down if can_scroll_down
    else
      select((index + 1) % item_max)
    end
    Input.update
  end
  
  #--------------------------------------------------------------------------#
  # * Menu Display Functions
  #--------------------------------------------------------------------------#
  def refresh
    super
    draw_recipe if @current_recipe >= 0
  end
  
  def full_refresh
    super
    draw_recipe if @current_recipe >= 0
  end
  
  def draw_menu_option(option, index)
    super
    x = option[:x] + 2
    y = option[:y] + 2
    text = option[:name]
    
    slot = option[:slot]
    if @category_select
      if slot >= 0
        recipe_index = slot + @recipe_index
        if recipe_exists(recipe_index)
          known_index = @recipes[recipe_index][0]
          recipe = @recipes[recipe_index][1]
          if has_recipe_index(known_index)
            item = $data_items[recipe[0]]
            if !item.nil?
              draw_icon(item.icon_index, x, y)
              text = item.name
            end
          else
            text = "????"
          end
        else
          text = ""
        end
      end
    else
      if slot >= 0
        category = ASM::Cooking::get_categories[slot]
        draw_icon(category[0], x, y)
        text = category[1]
      end
    end
    
    x += 30
    
    draw_text(menu_option_rect(option, x, y), text)
  end
  
  def draw_recipe
    if recipe_exists(@current_recipe)
      known_index = @recipes[@current_recipe][0]
      recipe = @recipes[@current_recipe][1]
      if has_recipe_index(known_index)
        x = 50
        y = 305
        change_color(system_color)
        draw_item_info($data_items[recipe[0]], x, y, "", ":") # Recipe Item
        x += 20
        y += 41
        change_color(normal_color)
        item = (recipe[1] < 0) ? nil : $data_items[recipe[1]]
        draw_item_info(item, x, y, "None") # Ingredient 1
        y += 31
        item = (recipe[2] < 0) ? nil : $data_items[recipe[2]]
        draw_item_info(item, x, y, "None") # Ingredient 2
        y += 31
        item = (recipe[3] < 0) ? nil : $data_items[recipe[3]]
        draw_item_info(item, x, y, "None") # Ingredient 3
        y += 31
        item = (recipe[4] < 0) ? nil : $data_items[recipe[4]]
        draw_item_info(item, x, y, "None") # Ingredient 4
      end
    end
  end
  
  def draw_item_info(item, x, y, blank_text="", add_text="")
    text = blank_text + add_text
    
    if !item.nil?
      draw_icon(item.icon_index, x, y)
      text = item.name + add_text
    end
    
    x += 30
    
    rect = Rect.new
    rect.x = x
    rect.y = y
    rect.width = 260
    rect.height = 30
    
    draw_text(rect, text)
  end
  
  #--------------------------------------------------------------------------
  # * Layout Options
  #--------------------------------------------------------------------------  
  def menu_background_image
    if @category_select
      return "SAM-recipe-background"
    else
      return "SAM-recipe-category-background"
    end
  end
end
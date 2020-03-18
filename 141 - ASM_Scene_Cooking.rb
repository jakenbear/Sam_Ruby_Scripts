#==============================================================================
# ** Always Sometimes Monsters: Scene_Cooking
#------------------------------------------------------------------------------
#  This is the cooking menu scene class
#==============================================================================

class Scene_Cooking < Scene_MenuBase
  #--------------------------------------------------------------------------
  # * Start Processing
  #--------------------------------------------------------------------------
  def start
    super
    create_help_window
    create_item_window
    create_recipe_window
    create_command_window
  end
  #--------------------------------------------------------------------------
  # * Get Currently Selected Item
  #--------------------------------------------------------------------------
  def item
    @item_window.item
  end
  #--------------------------------------------------------------------------
  # * Activate Item Window
  #--------------------------------------------------------------------------
  def activate_item_window
    @item_window.refresh
    @item_window.activate
  end
  #--------------------------------------------------------------------------
  # * Create Command Window
  #--------------------------------------------------------------------------
  def create_command_window
    @command_window = ASM_Window_CookingMenu.new(465, 260, 350, 300, 20)
    @command_window.set_handler(:recipebook,    method(:command_recipebook))
    @command_window.set_handler(:baseitem,      method(:command_baseitem))
    @command_window.set_handler(:extraitem1,    method(:command_extraitem1))
    @command_window.set_handler(:extraitem2,    method(:command_extraitem2))
    @command_window.set_handler(:spice,         method(:command_spice))
    @command_window.set_handler(:cook,          method(:command_cook))
    @command_window.set_handler(:cancel,        method(:command_cancel))
    @command_window.open
    @command_window.activate
    @command_window.select(0)
  end
  #--------------------------------------------------------------------------
  # * Create Help Window
  #--------------------------------------------------------------------------
  def create_help_window
    x = (Graphics.width / 2) - 150
    y = 100
    width = 300
    @help_window = Window_CookingHelp.new(x, y, width, 3)
    @help_window.viewport = @viewport
  end
  #--------------------------------------------------------------------------
  # * Create Item Window
  #--------------------------------------------------------------------------
  def create_item_window
    x = (Graphics.width/ 2) - 150
    y = 100 + @help_window.height
    width = 300
    height = Graphics.height - 200 - @help_window.height
    @item_window = Window_CookingItemList.new(x, y, width, height, 60)
    @item_window.viewport = @viewport
    @item_window.help_window = @help_window
    @item_window.set_handler(:ok,     method(:on_item_ok))
    @item_window.set_handler(:cancel, method(:on_item_cancel))
  end
  #--------------------------------------------------------------------------
  # * Create Recipe Book Window
  #--------------------------------------------------------------------------
  def create_recipe_window
    @recipe_window = ASM_Window_RecipeBook.new(775, 2, 360, 530, 40)
    @recipe_window.set_handler(:close_book,     method(:recipe_close))
    @recipe_window.set_handler(:scroll_up,      method(:recipe_scrollup))
    @recipe_window.set_handler(:go_back,        method(:recipe_goback))
    @recipe_window.set_handler(:set_category,   method(:recipe_setcategory))
    @recipe_window.set_handler(:recipe,         method(:recipe_select))
    @recipe_window.set_handler(:scroll_down,    method(:recipe_scrolldown))
    @recipe_window.set_handler(:cancel,         method(:recipe_cancel))
  end
  
  #--------------------------------------------------------------------------
  # * Inventory management
  #--------------------------------------------------------------------------
  def open_inventory(type=0)
    @command_window.close
    @help_window.open
    @item_window.category = type
    @item_window.open
    @item_window.select_last
    activate_item_window
  end
  
  #--------------------------------------------------------------------------
  # * [Recipe Book] Command
  #--------------------------------------------------------------------------
  def command_recipebook
    @command_window.deactivate
    @recipe_window.open
    @recipe_window.activate
    @recipe_window.set_start_index
  end
  #--------------------------------------------------------------------------
  # * [Base Ingredient] Command
  #--------------------------------------------------------------------------
  def command_baseitem
    @command_window.return_ingredient(0)
    open_inventory(1)
  end
  #--------------------------------------------------------------------------
  # * [Extra Ingredient 1] Command
  #--------------------------------------------------------------------------
  def command_extraitem1
    @command_window.return_ingredient(1)
    open_inventory(2)
  end
  #--------------------------------------------------------------------------
  # * [Extra Ingredient 2] Command
  #--------------------------------------------------------------------------
  def command_extraitem2
    @command_window.return_ingredient(2)
    open_inventory(2)
  end
  #--------------------------------------------------------------------------
  # * [Spice] Command
  #--------------------------------------------------------------------------
  def command_spice
    @command_window.return_ingredient(3)
    open_inventory(3)
  end
  
  #--------------------------------------------------------------------------
  # * [Cancel] Command
  #--------------------------------------------------------------------------
  def command_cancel
    @command_window.return_ingredients
    ASM::Cooking::set_last_recipe(-1)
    return_scene
  end
  
  #--------------------------------------------------------------------------
  # * [Cook] Command
  #--------------------------------------------------------------------------
  def command_cook
    # Grab our ingredients and cook them
    ingredients = @command_window.ingredients
    item = ASM::Cooking::cook_recipe(ingredients)
    # Now pass the cooked item info back to the game
    if item
      # Give the item from the recipe
      $game_party.gain_item(item, 1)
      ASM::Cooking::set_last_recipe(item.id)
      ASM::Cooking::set_last_recipe_name(item.name)
      ASM::Cooking::set_last_recipe_icon(item.icon_index)
    else
      # Check player cooking skill
      skill = ASM::Cooking::get_cooking_skill
      check = Random.new
      chance = check.rand(ASM::Cooking::get_garbage_chance) + skill
      # If chance >= 15 then don't make garbage food
      if chance >= ASM::Cooking::get_garbage_chance
        # Make sure ingredients are returned
        @command_window.return_ingredients
        ASM::Cooking::set_last_recipe(-2) # -2 flags as canceling garbage food
      else
        # Give the garbage food item and increase cooking skill
        item = ASM::Cooking::failed_recipe_item
        $game_party.gain_item(item, 1)
        ASM::Cooking::set_cooking_skill(skill+1)
        ASM::Cooking::set_last_recipe(-1) # -1 flags as garbage food
        ASM::Cooking::set_last_recipe_name(item.name)
        ASM::Cooking::set_last_recipe_icon(item.icon_index)
      end
    end
    # Queue up the cooking completion common event
    ASM::Cooking::cooking_common_event
    return_scene
  end
  #--------------------------------------------------------------------------
  # * Item [OK]
  #--------------------------------------------------------------------------
  def on_item_ok
    @command_window.update_ingredient(item)
    on_item_cancel
  end
  #--------------------------------------------------------------------------
  # * Item [Cancel]
  #--------------------------------------------------------------------------
  def on_item_cancel
    @item_window.unselect
    @item_window.close
    @help_window.close
    @command_window.open
    @command_window.activate
  end
  
  #--------------------------------------------------------------------------
  # * Recipe Book [Cancel]
  #--------------------------------------------------------------------------
  def recipe_cancel
    @recipe_window.deactivate
    @command_window.open
    @command_window.activate
  end
  
  #--------------------------------------------------------------------------
  # * Recipe Book [Close]
  #--------------------------------------------------------------------------
  def recipe_close
    @recipe_window.close
    recipe_cancel
  end
  
  #--------------------------------------------------------------------------
  # * Recipe Book [Scroll Up]
  #--------------------------------------------------------------------------
  def recipe_scrollup
    @recipe_window.scroll_up
  end
  
  #--------------------------------------------------------------------------
  # * Recipe Book [Scroll Down]
  #--------------------------------------------------------------------------
  def recipe_scrolldown
    @recipe_window.scroll_down
  end
  
  #--------------------------------------------------------------------------
  # * Recipe Book [Go Back]
  #--------------------------------------------------------------------------
  def recipe_goback
    @recipe_window.show_categories
  end
  
  #--------------------------------------------------------------------------
  # * Recipe Book [Set Category]
  #--------------------------------------------------------------------------
  def recipe_setcategory
    @recipe_window.set_category
  end
  
  #--------------------------------------------------------------------------
  # * Recipe Book [Select]
  #--------------------------------------------------------------------------
  def recipe_select
    @recipe_window.set_recipe
  end
end
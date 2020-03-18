module DataManager  
  class << self
    alias data_load_fix_setup_new_game setup_new_game
    def setup_new_game
      data_load_fix_setup_new_game
      ASM::Cooking::init_recipe_variables
      ASM::ShelfStorage::init_storage_variables
    end
    
    alias data_load_fix_reload_map_if_updated reload_map_if_updated
    def reload_map_if_updated
      data_load_fix_reload_map_if_updated
      $game_player.full_refresh
      ASM::Cooking::init_recipe_variables
      ASM::ShelfStorage::init_storage_variables
    end
  end
end

class Game_Character < Game_CharacterBase
  def full_refresh
    # Galv Move Route Extra Fixes
    @crepeats = 0
    @crepeat_next = 0
  end
end

# Effectus + Save Engine fixes
class Scene_Map < Scene_Base
  def pre_transfer
    @map_name_window.close if @map_name_window
    case $game_temp.fade_type
    when 0
      fadeout(fadeout_speed)
    when 1
      white_fadeout(fadeout_speed)
    end
  end
  
  def post_transfer
    case $game_temp.fade_type
    when 0
      Graphics.wait(fadein_speed / 2)
      fadein(fadein_speed)
    when 1
      Graphics.wait(fadein_speed / 2)
      white_fadein(fadein_speed)
    end
    create_location_window unless $game_map.display_name.empty?
    @map_name_window.open if @map_name_window
    Autosave.call if $game_switches[ToddAutoSaveAce::AUTOSAVETM] == true
  end
end
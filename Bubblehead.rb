#==============================================================================
#------------------------------------------------------------------------------
#  JAKES CUSTOM ENGINE EDITS
#==============================================================================

#UPDATE Balloon positions
class Sprite_Character
  def start_balloon
    dispose_balloon
    @balloon_duration = 8 * balloon_speed + balloon_wait
    @balloon_sprite = ::Sprite.new(viewport)
    @balloon_sprite.bitmap = Cache.system("Balloon")
    @balloon_sprite.ox = 16
    #JAR EDIT - kid balloons
    if $game_switches[1430] == false
      @balloon_sprite.oy = 22 + $game_variables[1994] #ADULT - Default was 32
    end
    if $game_switches[1430] == true
      @balloon_sprite.oy = 10 + $game_variables[1994] #KID - Default was 12 lower than adults
    end
    update_balloon
    #Reset Modification
    if $game_variables[1994] != 0
      $game_variables[1994] = 0
    end
  end
end
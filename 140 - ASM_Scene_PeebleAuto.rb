#==============================================================================
# ** Always Sometimes Monsters: Scene_PeebleAuto
#------------------------------------------------------------------------------
#  This is the Peeble scene class for ASM with auto close
#==============================================================================

class Scene_PeebleAuto < Scene_Peeble
  
  SMOOTH_FACTOR = 1000
  
  def check_closing
    @time_limit = 4000
    @close_time += $time.delta * SMOOTH_FACTOR
    if @close_time >= @time_limit
      @peebleclose = true
    end
  end
end
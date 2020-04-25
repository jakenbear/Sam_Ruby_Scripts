#==============================================================================
#------------------------------------------------------------------------------
#  JAKES CUSTOM ENGINE EDITS Version 1.5
#==============================================================================
# Jakes Video Player
#
################################
# Sample Calls
# v = Video_Player.new
# v.play_custom_video(1,"anims/ANIM_AguaCanyon",1,19,400,216,0,20,2,0,255)
# v.kill_custom_video(1)
# v.play_custom_video(2,"anims/SunSet",1,47,0,0,0,1,12,0,255)
# v.kill_custom_video(2)
# ##############################
# Need to call v = Video_Player.new to create 
# Options are: 
# (id,filename,start_frame,end_frame,x,y,origin,loops,wait_time,reverse,opacity)
#  id: The layer Id to play the video on. 
#  filename: The name o the folder and base file name without frame #
#  start_frame: What frame to start at, default this to 1
#  end_frame: What frame to end at. Make sure it exists
#  x: the X postion to play the movie at. Default: 0
#  y: the Y postion to play the movie at. Default: 0
#  origin: The image origin. Default: 0
#  loops: Default to 1 loop, but how many times it loops. Default: 1
#  wait_time: Time bewtween changing images. Must be integer. Default: 2
#  reverse: 0 = Play forward, 1 = play frames in reverse
#  opacity: Image opacity. Default = 255 (range (0 to 255)
#
class Video_Player < Game_Interpreter   
    def initialize
      @layers = []    
    end
    
    def kill_custom_video(id)
      @layers[id].dispose
      @layers.delete_at(id)
    end
  
    def get_layer(id)
      return @layers[id]
    end
    
    def play_custom_video(id,filename,start_frame,end_frame,x=0,y=0,origin=0,loops=1,wait_time=2,reverse=0,opacity=255)
      @loop_tracker = loops
      @layer = ASM_Layer.new
      @layer.set_origin(origin)
      @layer.x = x
      @layer.y = y
      @layer.opacity = opacity
      @layer.z = id + 1 + 100
      @layer.zoom_x = ASM::graphics_width_scale
      @layer.zoom_y = ASM::graphics_height_scale
      @layers[id] = @layer
      
      if reverse == 0
        for j in 1..loops do
          for i in start_frame..end_frame do
            wait(wait_time)
            @layers[id].set_image(filename + i.to_s)
          end
        end      
      else
        #reverse
        for j in 1..loops do
          for i in end_frame.downto(start_frame) do
            wait(wait_time)
            @layers[id].set_image(filename + i.to_s)
          end
        end   
      end
    end
end #class
# Jakes Video Player

module Colors
  #--------------------------------------------------------------------------#
  # * Colors
  #--------------------------------------------------------------------------#
  White = Color.new(255,255,255)
  LightRed = Color.new(255,150,150)
  LightGreen = Color.new(150,255,150)
  LightBlue = Color.new(150,150,255)
  DarkYellow = Color.new(225,225,20)
  Alpha = Color.new(0,0,0,128)
  AlphaMenu = 100
end

# GLOBAL CONTROL DEFAULT GAME FONT HERE

#Font.default_name = ["Ariel"]
Font.default_name = ["Bitter-Regular"]
Font.default_size = 21
Font.default_bold = false
Font.default_italic = false
Font.default_shadow = true
Font.default_outline = true
Font.default_color = Colors::White
Font.default_out_color = Colors::Alpha
 

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

#UPDATE GAME Interpreter for custom chairs
class Game_Interpreter
#--------------------------------------------------------------------------
  # * Conditional Branch
  #--------------------------------------------------------------------------
  def command_111
    result = false
    case @params[0]
    when 0  # Switch
      result = ($game_switches[@params[1]] == (@params[2] == 0))
    when 1  # Variable
      value1 = $game_variables[@params[1]]
      if @params[2] == 0
        value2 = @params[3]
      else
        value2 = $game_variables[@params[3]]
      end
      case @params[4]
      when 0  # value1 is equal to value2
        result = (value1 == value2)
      when 1  # value1 is greater than or equal to value2
        result = (value1 >= value2)
      when 2  # value1 is less than or equal to value2
        result = (value1 <= value2)
      when 3  # value1 is greater than value2
        result = (value1 > value2)
      when 4  # value1 is less than value2
        result = (value1 < value2)
      when 5  # value1 is not equal to value2
        result = (value1 != value2)
      end
    when 2  # Self switch
      if @event_id > 0
        key = [@map_id, @event_id, @params[1]]
        result = ($game_self_switches[key] == (@params[2] == 0))
      end
    when 3  # Timer
      if $game_timer.working?
        if @params[2] == 0
          result = ($game_timer.sec >= @params[1])
        else
          result = ($game_timer.sec <= @params[1])
        end
      end
    when 4  # Actor
      actor = $game_actors[@params[1]]
      if actor
        case @params[2]
        when 0  # in party
          result = ($game_party.members.include?(actor))
        when 1  # name
          result = (actor.name == @params[3])
        when 2  # Class
          result = (actor.class_id == @params[3])
        when 3  # Skills
          result = (actor.skill_learn?($data_skills[@params[3]]))
        when 4  # Weapons
          result = (actor.weapons.include?($data_weapons[@params[3]]))
        when 5  # Armors
          result = (actor.armors.include?($data_armors[@params[3]]))
        when 6  # States
          result = (actor.state?(@params[3]))
        end
      end
    when 5  # Enemy
      enemy = $game_troop.members[@params[1]]
      if enemy
        case @params[2]
        when 0  # appear
          result = (enemy.alive?)
        when 1  # state
          result = (enemy.state?(@params[3]))
        end
      end
    when 6  # Character
      character = get_character(@params[1])
      if character
        result = (character.direction == @params[2])
      end
    when 7  # Gold
      case @params[2]
      when 0  # Greater than or equal to
        result = ($game_party.gold >= @params[1])
      when 1  # Less than or equal to
        result = ($game_party.gold <= @params[1])
      when 2  # Less than
        result = ($game_party.gold < @params[1])
      end
    when 8  # Item
      result = $game_party.has_item?($data_items[@params[1]])
    when 9  # Weapon
      result = $game_party.has_item?($data_weapons[@params[1]], @params[2])
    when 10  # Armor
      result = $game_party.has_item?($data_armors[@params[1]], @params[2])
    when 11  # Button
      if $game_switches[1207] == false
        result = Input.press?(@params[1])
      else
        # JAR CUSTON CONTROLLER HACK SCRIPT
        result = Input.press?(@params[1])
        mydir = @params[1]
        if (eval("Input.trigger?(:DOWN)") == true) && (mydir == 2) 
          result = Input.trigger?(:DOWN)
        end
        if (eval("Input.trigger?(:LEFT)") == true) && (mydir == 4) 
          result = Input.trigger?(:LEFT)
        end
        if (eval("Input.trigger?(:RIGHT)") == true) && (mydir == 6) 
          result = Input.trigger?(:RIGHT)
        end
        if (eval("Input.trigger?(:UP)") == true) && (mydir == 8) 
          result = Input.trigger?(:UP)
        end
        
        #Disabled , controller players
        #if (eval("Input.trigger?(:C)") == true) 
        #  result = Input.trigger?(:C)
        #end
        #if (eval("Input.trigger?(:B)") == true) 
        #  result = Input.trigger?(:B)
        #end
        #if (eval("Input.trigger?(:A)") == true) 
        #  result = Input.trigger?(:A)
        #end
       end
    when 12  # Script
      result = eval(@params[1])
    when 13  # Vehicle
      result = ($game_player.vehicle == $game_map.vehicles[@params[1]])
    end
    @branch[@indent] = result
    command_skip if !@branch[@indent]
  end
end

#Start Cursor for text entry on backspace
# Set VAR 1820 to the starting position you want 
# The backspace is position 88 
class Window_NameInput < Window_Selectable

def initialize(edit_window)
    super(edit_window.x, edit_window.y + edit_window.height + 8,
          edit_window.width + 20 , fitting_height(9))
    @edit_window = edit_window
    @page = 0
    @index = $game_variables[1820]
    refresh
    update_cursor
    activate
end

end
# This scriptlet changes the default stepping behavior 
# for followers.
# Settings are as follows:
# SWITCH 2885
# [OFF] - Followers will never step with player
# [ON] - Followers will step with player

class Game_Follower < Game_Character

  def update
    @move_speed     = $game_player.real_move_speed
    @transparent    = $game_player.transparent
    @walk_anime     = $game_player.walk_anime
    if  $game_switches[2885] == true
      @step_anime     = $game_player.step_anime
    end
    @direction_fix  = $game_player.direction_fix
    @opacity        = $game_player.opacity
    @blend_type     = $game_player.blend_type
    super
  end
  
   def chase_preceding_character
     if $game_switches[2840]
      move_rule = !moving?
     else
      move_rule = moving?
     end
     unless move_rule
      sx = distance_x_from(@preceding_character.x)
      sy = distance_y_from(@preceding_character.y)
      if sx != 0 && sy != 0
        move_diagonal(sx > 0 ? 4 : 6, sy > 0 ? 8 : 2)
      elsif sx != 0
        move_straight(sx > 0 ? 4 : 6)
      elsif sy != 0
        move_straight(sy > 0 ? 8 : 2)
      end
    end
  end
end

#Reset all self switches on map
class Game_Interpreter  

  def reset_all_self_switch_a(map_id)
    map = load_data(sprintf("Data/Map%03d.rvdata2", map_id))
    map.events.each do |i, event|      
      key = [map_id, i, 'D']      
      $game_self_switches[key] = false    
     end  
  end

end

#DOG FEEDER FIX
class Scene_Base
  def return_scene
    $game_variables[2403] = 0 #DOG FEED RESET
    SceneManager.return
  end
end
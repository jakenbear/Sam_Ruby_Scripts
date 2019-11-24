#==============================================================================
#------------------------------------------------------------------------------
#  JAKES CUSTOM ENGINE EDITS
#==============================================================================
# FONT DEFAULTS:

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
        if (eval("Input.trigger?(:C)") == true) 
          result = Input.trigger?(:C)
        end
        if (eval("Input.trigger?(:B)") == true) 
          result = Input.trigger?(:B)
        end
        if (eval("Input.trigger?(:A)") == true) 
          result = Input.trigger?(:A)
        end
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
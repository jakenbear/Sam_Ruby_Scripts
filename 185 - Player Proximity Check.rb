class Game_Character < Game_CharacterBase
  def back_away_from_player(range_limit)
    sx = distance_x_from($game_player.x)
    sy = distance_y_from($game_player.y)
    
    range = -1
    if sx.abs > sy.abs
      range = sx.abs
    else
      range = sy.abs
    end
    
    if range <= range_limit
      move_away_from_xy($game_player.x,$game_player.y)
    end
  end
end

class Game_Character < Game_CharacterBase
  def player_within_range(range_limit)
    sx = distance_x_from($game_player.x)
    sy = distance_y_from($game_player.y)
    
    range = -1
    if sx.abs > sy.abs
      range = sx.abs
    else
      range = sy.abs
    end
    
    if range <= range_limit
      move_toward_xy($game_player.x,$game_player.y)
    end
  end
end

class Game_Character < Game_CharacterBase
  def TurnSwitchA(range_limit)
    sx = distance_x_from($game_player.x)
    sy = distance_y_from($game_player.y)
    
    range = -1
    if sx.abs > sy.abs
      range = sx.abs
    else
      range = sy.abs
    end
    
    if range <= range_limit
      self_switch("A", true)
    else
      
    end
  end
end

class Game_Character < Game_CharacterBase
  def player_hear_door(rangeX, rangeY)
    sx = distance_x_from($game_player.x)
    sy = distance_y_from($game_player.y)
    
    range = -1
    if sx.abs > sy.abs
      range = sx.abs
    else
      range = sy.abs
    end
    
    if sx.abs > sy.abs
      if range <= rangeX
        RPG::SE.new("SAMAUDIO_DoorOpen3", 50, 100).play
      end
    else
      if range <= rangeY
          RPG::SE.new("SAMAUDIO_DoorOpen3", 50, 100).play
      end
    end
  end
end

class Game_Character < Game_CharacterBase
  def player_see_car(rangeX, rangeY)
    sx = distance_x_from($game_player.x)
    sy = distance_y_from($game_player.y)
    
    range = -1
    if sx.abs > sy.abs
      range = sx.abs
    else
      range = sy.abs
    end
    
    if sx.abs > sy.abs
      if range <= rangeX
        
      end
    else
      if range <= rangeY
          RPG::SE.new("SAMAUDIO_DoorOpen3", 50, 100).play
      end
    end
  end
end

class Game_Character < Game_CharacterBase
  def bird_alert(range_limit)
    sx = distance_x_from($game_player.x)
    sy = distance_y_from($game_player.y)
    
    range = -1
    if sx.abs > sy.abs
      range = sx.abs
    else
      range = sy.abs
    end
    
    if range <= range_limit
      self_switch("A", true)  
      RPG::SE.new("SAMAUDIO_PigeonFly1", 70, 100).play
    end
  end
end


class Game_Character < Game_CharacterBase
  def bird_alertX(range_limit)
    sx = distance_x_from($game_player.x)
    sy = distance_y_from($game_player.y)
    
    range = -1
    if sx.abs > sy.abs
      range = sx.abs
    else
      range = sy.abs
    end
    
    if range <= range_limit
      self_switch("B", false) 
      RPG::SE.new("SAMAUDIO_PigeonFly1", 70, 100).play
    else
       #move_toward_xy($game_player.x,$game_player.y) #THey were movingonto road
       #random_region(7) #jar add
    end
  end
end

class Game_Character < Game_CharacterBase
  def bird_alertDead(range_limit)
    sx = distance_x_from($game_player.x)
    sy = distance_y_from($game_player.y)
    
    range = -1
    if sx.abs > sy.abs
      range = sx.abs
    else
      range = sy.abs
    end
    
    if range >= range_limit
      self_switch("D", false) 
    end
  end
end

class Game_Character < Game_CharacterBase
  def buzzard(range_limit)
    sx = distance_x_from($game_player.x)
    sy = distance_y_from($game_player.y)
    
    range = -1
    if sx.abs > sy.abs
      range = sx.abs
    else
      range = sy.abs
    end
    
    if range <= range_limit
      $game_switches[1852] = true 
      RPG::SE.new("SAMAUDIO_Vulture1", 70, 100).play
    end
  end
end
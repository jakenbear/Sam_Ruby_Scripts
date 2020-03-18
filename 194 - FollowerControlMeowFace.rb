#==============================================================================
# ■ Meow Face Party Controller
#------------------------------------------------------------------------------
# Control Party Leader and Followers
#==============================================================================
# How to Use:
# Plug & Play, Put this script below Material and above Main
# Terms of Use:
# Free for both commercial/non-commercial
#==============================================================================
=begin
==============================================================================
 Use these script calls below in event's script box
==============================================================================
------------------------------------------------------------------------------
 To gather all party members instantly:
------------------------------------------------------------------------------
 instant_gather

------------------------------------------------------------------------------
 To have all party jump together:
------------------------------------------------------------------------------
 party_jump(x, y)
 where x/y is the position to jump
 
 eg. 3 tiles to the left, use:
 party_jump(-3, 0)

------------------------------------------------------------------------------
 To have all party pop up balloon:
------------------------------------------------------------------------------
 party_balloon(id)
 where id is the balloon id

------------------------------------------------------------------------------
 To have all party pop up animation:
------------------------------------------------------------------------------
 party_anim(id)
 where id is the animation id
 
------------------------------------------------------------------------------
 To have the whole party move around:
------------------------------------------------------------------------------
 party_move(command)
  command =
 "DOWN"
 "LEFT"
 "RIGHT"
 "UP"
 "LOWER_L"
 "LOWER_R"
 "UPPER_L"
 "UPPER_R"
 "FORWARD"
 "BACKWARD"
 "TURN_R"
 "TURN_L"
 "TURN_B"
 
------------------------------------------------------------------------------
 To have the whole party face a direction:
------------------------------------------------------------------------------
 party_face(command)
  command =
 "DOWN"
 "LEFT"
 "RIGHT"
 "UP"
 "PLAYER"
 
------------------------------------------------------------------------------
 To have one party member face a direction:
------------------------------------------------------------------------------
 member_face(n, command)
 n = party member in line (0 = leader, 1 = 2nd in line etc)
  command =
 "DOWN"
 "LEFT"
 "RIGHT"
 "UP"
 "PLAYER"

------------------------------------------------------------------------------
 To have one party member jump:
------------------------------------------------------------------------------
 member_jump(n, x, y)
 n = party member in line (0 = leader, 1 = 2nd in line etc)
 x/y is the position to jump
 
 eg. 3 tiles to the right, use:
 party_jump(3, 0)

------------------------------------------------------------------------------
 To have one party member move around:
------------------------------------------------------------------------------
 member_move(n, command)
 n = party member in line (0 = leader, 1 = 2nd in line etc)
 command =
 "DOWN"
 "LEFT"
 "RIGHT"
 "UP"
 "LOWER_L"
 "LOWER_R"
 "UPPER_L"
 "UPPER_R"
 "FORWARD"
 "BACKWARD"
 "TURN_R"
 "TURN_L"
 "TURN_B"

 eg. to have 2nd member in line move lower right
  member_move(1, "LOWER_R")
  
------------------------------------------------------------------------------
 To have a party member pop up balloon:
------------------------------------------------------------------------------
 member_balloon(n, id)
 n = party member in line (0 = leader, 1 = 2nd in line etc)
 where id is the balloon id

------------------------------------------------------------------------------
 To have a party member pop up animation:
------------------------------------------------------------------------------
 member_anim(n, id)
 n = party member in line (0 = leader, 1 = 2nd in line etc)
 where id is the animation id

=end
#==============================================================================
class Game_Character < Game_CharacterBase
  def face_player
    set_direction($game_player.direction)
  end
end
class Game_Player < Game_Character
  attr_accessor :through
end
class Game_Follower < Game_Character
  alias meow_init initialize
  def initialize(member_index, preceding_character)
    meow_init(member_index, preceding_character)
    $meowchase = false
  end
  alias meow_chase chase_preceding_character
  def chase_preceding_character
    return if $meowchase
    meow_chase
  end
end
class Game_Interpreter
  def meow_party
    @meowparty = [$game_player] + $game_player.followers.visible_folloers
  end
  def instant_gather
    meow_party
    @meowparty.each do |meow|
      meow.moveto($game_player.x, $game_player.y)
    end
  end
  def party_jump(x, y)
    meow_party
    start_x, start_y = $game_player.x, $game_player.y
    @meowparty.each do |meow|
      meow.moveto(start_x, start_y)
      meow.jump(x, y)
      Fiber.yield while meow.jumping?
    end
  end
  def member_jump(n, x, y)
    meow_party
    @meowparty[n].jump(x, y) if @meowparty[n] != nil
  end
  def turn_face
    case @meowturn
    when "DOWN"; @mew.set_direction(2)
    when "LEFT"; @mew.set_direction(4)
    when "RIGHT"; @mew.set_direction(6)
    when "UP"; @mew.set_direction(8)
    when "PLAYER"; @mew.face_player
    end
  end
  def party_face(meowcommand)
    meow_party
    @meowturn = meowcommand
    @meowparty.each do |m|
      @mew = m
      turn_face
    end
  end
  def member_face(n, meowcommand)
    meow_party
    @meowturn = meowcommand
    @mew = @meowparty[n]
    if @mew != nil
      turn_face
    end    
  end
  def run_member_move
    case @meowmove
    when "DOWN"; @mew.move_straight(2)
    when "LEFT"; @mew.move_straight(4)
    when "RIGHT"; @mew.move_straight(6)
    when "UP"; @mew.move_straight(8)
    when "LOWER_L"; @mew.move_diagonal(4, 2)
    when "LOWER_R"; @mew.move_diagonal(6, 2)
    when "UPPER_L"; @mew.move_diagonal(4, 8)
    when "UPPER_R"; @mew.move_diagonal(6, 8)
    when "FORWARD"; @mew.move_forward
    when "BACKWARD"; @mew.move_backward
    when "TURN_R"; @mew.turn_right_90
    when "TURN_L"; @mew.turn_left_90
    when "TURN_B"; @mew.turn_180
    end
  end
  def party_move(meowcommand)
    meow_party
    $game_player.through = true
    $meowchase = true
    @meowmove = meowcommand
    @meowparty.each do |m|
      @mew = m
      run_member_move
    end
    Fiber.yield while @mew.moving?
    $game_player.through = false
    $meowchase = false
  end
  def member_move(n, meowcommand)
    meow_party
    $meowchase = true
    $game_player.through = true
    @meowmove = meowcommand
    @mew = @meowparty[n]
    if @mew != nil
      run_member_move
      Fiber.yield while @mew.moving?
    end
    $meowchase = false
    $game_player.through = false
  end
  def member_balloon(n, m)
    meow_party
    @meowparty[n].balloon_id = m if @meowparty[n] != nil
  end
  def member_anim(n, m)
    meow_party
    @meowparty[n].animation_id = m if @meowparty[n] != nil
  end
  def party_balloon(m)
    meow_party
    @meowparty.each do |meow|
      meow.balloon_id = m
    end
  end
  def party_anim(m)
    meow_party
    @meowparty.each do |meow|
      meow.animation_id = m
    end
  end
end

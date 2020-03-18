#-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~
# ** Reproduce Events (retrocompatible)
#    Author: Eshra, fix by Matteo Nicolotti
#    First Version: 21 Sept. 2012
#-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~
#
#   Allows events to be loaded from other maps in your project and placed on
#   the current map. Also adds functionality for persistent events which will
#   stay on the map even if it is reloaded (switching maps or loading save
#   files).
#-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~
#
#------------------------------------------------------------------------------
# * How to Use
#------------------------------------------------------------------------------
# Use the EventSpawn.spawn_event(...) to place an event on the map, see source
# the parameters it takes are:
#
# spawn_from_map_id - the id of the map the event will be spawned from
# event_id - the id of the event to spawn
# x - the x coordinate to place the event
# y - the y coordinate to place the event
# persistent - if the event is persistant
# init_dir - currently not used
# opts = {} - an optional hash representing the self switches that will be on when
#             the event is spawned
#
# Example: EventSpawn.spawn_event(2,15,$game_player.x+1, $game_player.y, false,2)
#
# Heavily modified aliases:
# straighten inside Game_CharacterBase
# events are now "straightened" to correspond to their original pattern, not 1
#
# tileset_bitmap inside Sprite_Character
# now checks if the character has a specific map which the bitmap should be
# loaded from.
#
 
# Original Release Date: 7 Nov.2012
#
# Update Log
# June 4, 2013, Corrected alias to move_straight random event routes work now
# Novemeber 18, 2012: v0.2, Events can now be spawned by name.
# October 28, 2012: Can now remove spawned events.
# October 27, 2012: Finished adding support for persistent events, made code
#                   more extendible. Added code to allow use of tile graphics.
#
# Sepetember 21, 2012: Code reorganized made into it's own script for portability.
#
# August 2012: Version 0.0 completed
 
($imported ||= {})["Ra Event Spawn"] = 0.2
 
#==============================================================================
# * EventSpawn
#==============================================================================
module EventSpawn
  #----------------------------------------------------------------------------
  # * Constants
  #----------------------------------------------------------------------------
  module Constants
    SS = ['A','B','C','D']
    Tiles_On = true # can use tilesets from offscreen maps as event graphics
  end
  #----------------------------------------------------------------------------
  # * Spawn Event
  #----------------------------------------------------------------------------
  def self.spawn_event(spawn_from_map_id, _event_id, _x,
    _y, persistent, init_dir, opts = {}, name = nil)
    return unless SceneManager.scene_is?(Scene_Map)
 
    return if _event_id.nil? || spawn_from_map_id.nil?
   
    options = { :A => false, :B => false, :C => false, :D => false}.merge(opts)
    map = load_data(sprintf("Data/Map%03d.rvdata2", spawn_from_map_id))
    event_id = next_id
   
    _event_id = name.nil? ? _event_id : map.event_from_name(name).id # get from name if passed
 
    preprocessed_event = map.events[_event_id]
 
    preprocessed_event.id = event_id
    event = create_event(preprocessed_event, event_id)
 
    event.gen_from_map_id = spawn_from_map_id
    event.moveto(_x, _y)
    add_to_spmap(event)
   
    event.persistent = persistent
    persistent ? store_pev(event) : $game_map.spawned_event_ids.push(event_id)
    $game_map.need_refresh = true
   
    EventSpawn::Constants::SS.each{|letter|
      is_on = options[letter.to_sym]
      $game_self_switches[[$game_map.map_id, event_id, letter]] = is_on
    }
    return event
  end # End - spawn_event
 
  def self.next_id
    max_id = $game_system.max_evn_id;
    keys = $game_map.events.keys
    id = keys==[] ? 1 : keys.max + 1
    max_id = id > max_id ? max_id = id : max_id+1
   
    $game_system.max_evn_id = max_id # store the largest event id used so far
    return max_id
  end
  #----------------------------------------------------------------------------
  # * Helper method
  #----------------------------------------------------------------------------
  def self.add_to_spmap(ev)
    spm = SceneManager.scene.instance_eval('@spriteset')
    sp_map_sps = spm.instance_eval('@character_sprites')
    sp_map_sps.push(Sprite_Character.new(spm.instance_eval('@viewport1'), ev))
  end
  #----------------------------------------------------------------------------
  # * Create Event
  #----------------------------------------------------------------------------
  def self.create_event(preprocessed_event, event_id)
    $game_map.events[event_id] = Game_Event.new($game_map.map_id, preprocessed_event)
  end
  #----------------------------------------------------------------------------
  # * Process Persistent Events
  #----------------------------------------------------------------------------
  def self.store_pev(event)
    sys = $game_system
    $game_map.spawned_event_ids.push(event.id) # note: ** 1
    unless sys.persistent_events
     
    end
    (sys.persistent_events[$game_map.map_id] ||= []).push(event) # Set persistance data
   
    # Update the wrapped event's coordinates for reloading
    event.event.x = event.x
    event.event.y = event.y
  end # store_pev
  #----------------------------------------------------------------------------
  # * Set all selfswitches to false for the event on the current map
  #----------------------------------------------------------------------------
  def self.clean_self_switches(event_id)
    map_id = $game_map.map_id
    EventSpawn::Constants::SS.each{ |ch|
      $game_self_switches[[map_id,event_id,ch]] = false
    }
  end
end # EventSpawn
 
#==============================================================================
# * Game_System
#==============================================================================
class Game_System
 
  attr_accessor :persistent_events #stores persistent events information
  attr_accessor :max_evn_id # save the largest id used so far to prevent using
                              # the save id twice.
  #----------------------------------------------------------------------------
  # * Alias initialize
  #----------------------------------------------------------------------------
  alias reprod_evs_initialize_event_hash initialize
  def initialize
    reprod_evs_initialize_event_hash
    @persistent_events = {}
    @max_evn_id = 0
  end # End - initialize
  #----------------------------------------------------------------------------
  # * Alias on_after_load
  #----------------------------------------------------------------------------
  alias rep_evs_on_after_load on_after_load
  def on_after_load
    unless @persistent_events      
      @persistent_events = {}
      @max_evn_id = 0
    end
    $game_map.remove_temporary_spawned_events #remove previously spawned events
    rep_evs_on_after_load
  end # on_after_load
 
end # Game_System
 
#==============================================================================
# * Game_Map
#==============================================================================
class Game_Map
  attr_reader :spawned_event_ids
  attr_accessor :spawned_event_ids
  attr_accessor :events
  #----------------------------------------------------------------------------
  # * Alias setup
  #----------------------------------------------------------------------------
  alias reprod_evs_game_map_setup setup
  def setup(map_id)
    $game_map.clean_self_switches
    @spawned_event_ids = Array.new #the ids of the events that have been spawned
    reprod_evs_game_map_setup(map_id)
  end # End - setup
  #----------------------------------------------------------------------------
  # * Alias setup_events
  #----------------------------------------------------------------------------
  alias ra_dep_setup_evs_al_meth setup_events
  def setup_events
    ra_dep_setup_evs_al_meth
   
    # Correct the self switches if there are persistent events on the map
    if $game_system.persistent_events
      correct_self_switches if $game_system.persistent_events[@map_id] != nil
    end
  end # End - setup_events
  #----------------------------------------------------------------------------
  # * Correct Self Switches
  #     Corrects $selfswitches hash so that they correctly correlate to the events'
  #     ids upon reloading the map (The ids may change b/c of removed events).
  #----------------------------------------------------------------------------
  def correct_self_switches
    p_events = $game_system.persistent_events[@map_id]
    new_self_switches = {}     # the new global self switch hash
    loaded_events = []
    @spawned_event_ids = []    # reset spawned events
    p_events.each{ |ev|
       
        #initialize new id and self_switches
        new_event_id = @events.keys.max + 1
        new_self_switches[new_event_id] = get_self_switches(ev.id)
       
        ev.event.id = new_event_id # update interior events id
       
        loaded_event = Game_Event.new(@map_id, ev.event)
       
        #update extra unhandled information for the new event
        loaded_event.persistent = true
       
        #place the new event in the map's event hash
        @events[loaded_event.id] = loaded_event
       
        loaded_events.push(loaded_event)
        @spawned_event_ids.push(loaded_event.id) #update spawned events
      } # End - p_events.each
     
      #update the persistent_events hash with the new information
      $game_system.persistent_events[@map_id] = loaded_events
     
      local_ss = $game_self_switches
      new_self_switches.keys.each{|id|
        count = 0
        EventSpawn::Constants::SS.each{ |letter|
          $game_self_switches[[@map_id,id,letter]] = new_self_switches[id][count]
          count += 1
        }
      }
     
      # Refresh the events so they are placed on the map on the correct page
      # also reset the ids of the events inside @spawned_event_ids
      @events.keys.each{ |id|
        @events[id].refresh
      }
      refresh_tile_events
  end # End - correct_self_switches
  #----------------------------------------------------------------------------
  # * Get Self Switches
  #     returns an array of the selfswitches for the given event id and then
  #     deletes those values from $game_self_switches.
  #----------------------------------------------------------------------------
  def get_self_switches(event_id)
    local_ss = $game_self_switches
    vals = []
    EventSpawn::Constants::SS.each{ |letter|
      vals.push(local_ss[[@map_id, event_id, letter]])
      local_ss[[@map_id, event_id, letter]] = false
    }
    vals
  end # End - get_self_switches
  #----------------------------------------------------------------------------
  # * Clean Self Switches
  #     self-switches are handled globally, not on an event by event basis
  #     so the global hash needs to be cleaned out of all the temporarily
  #     spawned events when changing maps/loading the game, etc.
  #----------------------------------------------------------------------------
  def clean_self_switches
    local_ss = $game_self_switches
   
    return if @spawned_event_ids == nil
    @spawned_event_ids.each{ |id|
      if !@events[id].persistent #don't clean up persistant event self switches
        EventSpawn::Constants::SS.each{ |letter|
          local_ss[[@map_id, id, letter]] = false #reset self_switches of temp events
        }
      end # End if
    }
  end # End - clean_self_switches
  #----------------------------------------------------------------------------
  # Removes all of the nonpersistent spawned events from the current map
  #----------------------------------------------------------------------------
  def remove_temporary_spawned_events
    return if @spawned_event_ids.nil?
    clean_self_switches
    clean_temp_evs_helper
    need_refresh = true
  end # End - remove_temporary_spawned_events
  #----------------------------------------------------------------------------
  # * Cleans out temporary events
  #----------------------------------------------------------------------------
  def clean_temp_evs_helper
    @spawned_event_ids.each{|id| @events.delete(id) unless @events[id].persistent}
    @spawned_event_ids = []
  end # End - clean_temp_evs_helper
 
  #----------------------------------------------------------------------------
  # * Removes an event from the current map, including persistant events
  #----------------------------------------------------------------------------
  def destroy_event_any(id)
    return unless !(ev = @events[id]).nil?
    EventSpawn.clean_self_switches(id)
    ev.set_intp_repr_ev(0)
   
    ev.erase # to hide the graphic
   
    if persistants = $game_system.persistent_events[@map_id]
      persistants.each_with_index{ |ev, i|
        if ev.id == id
          persistants.delete_at(i)
          break
        end
      }
    end
   
    @spawned_event_ids.delete(id)   # delete from array
    @events.delete(id)              #   "     "   hash
   
    refresh
  end
end # End - Game_Map
 
#==============================================================================
# * Game_Character
#==============================================================================
class Game_Character < Game_CharacterBase
  attr_accessor :gen_from_map_id           # map the event was generated from
end
 
#==============================================================================
# * Game_Event
#==============================================================================
class Game_Event < Game_Character
  attr_accessor :event                   # wrapped event
  attr_accessor :id                      # id of this event
  attr_accessor :persistent              # does event stay after switching maps
 
  #attr_accessor :init_dir                # used to specify direction with throw!
  #----------------------------------------------------------------------------
  # * Alias method initialize
  #----------------------------------------------------------------------------
  alias ra_extra_fields_dep_init initialize
  def initialize(map_id, event)
    ra_extra_fields_dep_init(map_id,event)
    @persistent = false
    #@init_dir = -1
  end # End - initialize
 
  #--------------------------------------------------------------------------
  # * Alias straighten - sets pattern to orig_pattern
  #--------------------------------------------------------------------------
  alias straight_ev_sp_ed_st_orig straighten
  def straighten
    straight_ev_sp_ed_st_orig
    @pattern = @original_pattern ? @original_pattern : 1 if @walk_anime || @step_anime
  end
   
  #--------------------------------------------------------------------------
  # * Alias move_straight - Store updated postion for persistent events
  #--------------------------------------------------------------------------
  alias move_str_ed_fr_persis_support move_straight
  def move_straight(dir, turn_ok = true)
    move_str_ed_fr_persis_support(dir)
    @event.x, @event.y = @x, @y if @persistent
  end
 
  #--------------------------------------------------------------------------
  # * Alias move_diagonal- Store updated postion for persistent events
  #--------------------------------------------------------------------------
  alias move_diag_ed_fr_pesis_support move_diagonal
  def move_diagonal(horz, vert)
    move_diag_ed_fr_pesis_support(horz, vert)
    @event.x, @event.y = @x, @y if @persistent
  end
 
  def set_intp_repr_ev(id)
    @interpreter.set_ev_id_repr_ev(id) unless @interpreter.nil?
  end
end # Game_Event
 
#==============================================================================
# * Sprite_Character
#==============================================================================
class Sprite_Character < Sprite_Base
 
  #--------------------------------------------------------------------------
  # * Alias tileset_bitmap - load tiles from offscreen maps
  #--------------------------------------------------------------------------
  alias ts_bm_sprt_fr_offscr_maps tileset_bitmap
  def tileset_bitmap(tile_id)
   
    if (id = @character.gen_from_map_id) && id > 0
       map = load_data(sprintf("Data/Map%03d.rvdata2", id))
      return Cache.tileset($data_tilesets[map.tileset_id].tileset_names[5 + tile_id / 256])
    else
      return ts_bm_sprt_fr_offscr_maps(tile_id)
    end
   
  end # tileset_bitmap
 
end # Sprite_Character
#==============================================================================
# ** Game_Interpreter
#==============================================================================
class Game_Interpreter
  def set_ev_id_repr_ev(id)
    @event_id = id
  end # set_ev_id_repr_ev
end # Game_Interpreter
#==============================================================================
# ** RPG::Map
#==============================================================================
class RPG::Map
  #----------------------------------------------------------------------------
  # * Get Event From Name
  #----------------------------------------------------------------------------
  def event_from_name(name)
    @events.values.each{|ev| return ev if ev.name.eql?(name)}
    return nil
  end
end # RPG::Map
#End of File
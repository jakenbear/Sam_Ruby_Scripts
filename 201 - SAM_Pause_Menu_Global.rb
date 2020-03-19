#===============================================================================
# * [ACE] Global Setting Addon for Yanfly's System Options
#===============================================================================
# * Made by: Sixth (www.rpgmakervxace.net, www.forums.rpgmakerweb.com)
# * Version: 1.1
# * Updated: 22/10/2016
# * Requires: Yanfly's System Options
#-------------------------------------------------------------------------------
# * < Change Log >
#-------------------------------------------------------------------------------
# * Version 1.0 (21/10/2016)
#   - Initial release.
# * Version 1.1 (22/10/2016)
#   - Reworked/optimized the code.
#   - Now the script will automatically read the default values from
#     Yanfly's System Options and from my PC Timer Display Options script.
#     You can still set all the default values up in this script if you prefer
#     to keep all of them at the same place.
#   - Also automatically makes the switches and variables used in 
#     Yanfly's System Options global. You can still set the default values for
#     them in this script, otherwise, they will default to false.
#   - Fixed a bug with the "Revert Changes" option.
#-------------------------------------------------------------------------------
# * < Description >
#-------------------------------------------------------------------------------
# * This script will change the settings from Yanfly's System Options script to
#   be a global setting read from a file. This means that it will not reset 
#   after starting a new game anymore, all games will share the same settings!
# * Okay, the last bit is not entirely correct... You can make user specific
#   setting files, so depending on who is logged in on your PC (as a Windows 
#   user), a different one can be loaded. 
# * Set up all the default values for your settings in this script!
# * Switches and variables included in the default settings here will also 
#   become global ones! So, if they are changed in one game, they will be 
#   changed in all of the other games and save files! Keep this in mind!
# * Adds the option to add 2 new buttons for the options menu:
#   - Revert Changes: Reverts the changes made to the last saved settings.
#   - Default Settings: Loads the default settings.
# * Adds the possibility to add a button for the options menu on the title
#   screen. Because the settings are global now, they will work on the
#   title screen without any issues. Before making them global, all of the 
#   settings the player may have changed on the title screen were reseted once
#   the game was started/loaded, so adding the button to the title screen was
#   not really a good move until now.
# * You can also make global switches, variables and even self-switches with
#   this script, and these do not need to be connected with any settings at all.
#   Might be good for some extra secret scenes, or unlocking secret areas, etc.
#   Also, these switches, variables and self-switches can be used on the 
#   title screen too! You can make New Game+ button with these, for example
#   (as long as you know how to add custom buttons to the title commands).
# * Includes compatibility for my PC Clock Display - YF System Options Addon
#   script as well.
#------------------------------------------------------------------------------- 
# * < Installation >
#-------------------------------------------------------------------------------
# * In the script editor, place this script below Yanfly's System Options 
#   but above Main!
# * If you are using my PC Clock Display - YF System Options Addon script, you
#   must place this one below that script too!
#-------------------------------------------------------------------------------
# * < Compatibility Info >
#-------------------------------------------------------------------------------
# * No known incompatibilities.
#-------------------------------------------------------------------------------
# * < Known Issues >
#-------------------------------------------------------------------------------
# * No known issues.
#-------------------------------------------------------------------------------
# * < Terms of Use >
#-------------------------------------------------------------------------------
# * Free to use for whatever purposes you want.
# * Credit me (Sixth) in your game, pretty please! :P
# * Posting modified versions of this script is allowed as long as you notice me
#   about it with a link to it!
#===============================================================================
$imported = {} if $imported.nil?
$imported["SixthYanSysOptAdd"] = true
#===============================================================================
# Settings:
#===============================================================================
module YanSysOptAdd
  #-----------------------------------------------------------------------------
  # Debug Setting:
  #-----------------------------------------------------------------------------  
  # Just a debug setting.
  # If this is true, every time you start the game, the file used to store your
  # settings will be reloaded with the default settings you set up in this 
  # script!
  # true = reload, false = no reload.
  # Use it if you want to quickly reload the settings for some reason (most
  # probably for debugging).
  # WARNING:
  # You must set this to false for your public game relase, otherwise it will
  # break your options menu!
  #-----------------------------------------------------------------------------  
  Reload = false

  #-----------------------------------------------------------------------------  
  # Environmental Path Settings:
  #-----------------------------------------------------------------------------  
  # The environmental path of the folder for your file.
  # This path can differ from PC to PC, and that is why it should use the 
  # 'ENV' module to get the correct path to the desired folder(s).
  # In any case, you can edit the text inside the [brackets] to get different
  # folder paths. You can use these values:
  #
  # "AppData" = Will get: "C\\Users\\*Username*\\AppData\\Roaming"
  # "LOCALAPPDATA" = Will get: "C\\Users\\*Username*\\AppData\\Local"
  # "ProgramFiles" = Will get: "C\\ProgramFiles (x86)"
  # "CommonProgramFiles" = Will get: "C\\ProgramFiles (x86)\\Common Files"
  #
  # Again, these folder paths might differ, especially on different OS.
  # The examples I gave are for a Windows 7 PC with the windows installed on 
  # the C partition. 
  #
  # If you use the environmental path, depending on which one you choose, the
  # setting file can be a separate file for different users logged in on the
  # PC (as Windows users).
  #
  # Also, some of these might require your game to be "Run as Administrator"!
  #
  # If you don't want to use these environmental folder paths, you can use an
  # empty string for this setting, which looks like this: 
  #   DPath = ""
  # In this case, the root of the path will be your project's folder, so if you
  # just enter this, it will be in your project's folder.
  # This also means that all users of the PC (as Windows users) will share the
  # same settings. Might not be a good idea, if you ask me. :P
  #-----------------------------------------------------------------------------  
  #DPath = ENV["LOCALAPPDATA"]
  DPath = ""

  #-----------------------------------------------------------------------------
  # Static Path Settings:
  #-----------------------------------------------------------------------------  
  # This is the static sub-folder path to the actual file. These are the 
  # non-environmental parts of your folder path to your file.
  # Each string you add into the array will be a sub-folder created, nested in
  # each other.
  # The sample settings will place the used files to the following folder:
  # "C\\Users\\*Username*\\AppData\\Local\\MyProject\\GameSettings\\"
  # Again, this path might differ for different PC/OS version.
  #-----------------------------------------------------------------------------  
  #SPath = ["MyProject","GameSettings"]
  SPath = ["System"]

  #-----------------------------------------------------------------------------
  # File Name Settings:
  #-----------------------------------------------------------------------------  
  # And finally, the last setting for your setting file, it's name.
  # You can name it however you like.
  # It's extension can also be anything you like, such as .ini/.txt/.rvdata2 ...
  # Note that some minor encoding will be used on the file, so you will not be 
  # able to edit the file directly, regardless of what kind of extension you
  # use for it!
  #-----------------------------------------------------------------------------  
  FileName = "GameOptions.ini"
  
  #-----------------------------------------------------------------------------
  # Extra Button Settings:
  #-----------------------------------------------------------------------------  
  # These are the settings for the new options you can use in 
  # Yanfly's System Options script.
  # You can set up their name and description.
  # To use these new buttons in your game, just enter the following symbols
  # into the COMMANDS array found in Yanfly's System Options script:
  # :revert - Adds the "Revert Changes" button.
  # :default - Adds the "Default Settings" button.
  #-----------------------------------------------------------------------------  
  NewButtons = {
    :revert => { # Revert Changes:
      :name => "Revert Changes",
      :description => "This will revert the changes you made in the settings\n"+
                      "to the last saved one.",
    },
    :default => { # Default Settings:
      :name => "Default Settings",
      :description => "This will load the default settings.",
    },
  }
  
  #-----------------------------------------------------------------------------
  # Title Button Settings:
  #-----------------------------------------------------------------------------  
  # This will add the button for the options menu on the title screen.
  # Details:
  # :enable - Set this to true if you want to enable the options menu on the
  #           title screen, otherwise set it to false.
  # :index - The position of the new button. 0 = 1st button, 1 = 2nd button, 
  #          and so on.
  # :name - The name of the options button.
  # :remove_title - This will remove the "Return to Title" option from the 
  #                 settings menu if it is accessed from the title screen 
  #                 (only then!).
  #                 true will enable this feature, false will disable.
  # :remove_exit - This will remove the "Shutdown Game" option from the settings
  #                menu if it is accessed from the title screen (only then!).
  #                true will enable this feature, false will disable.
  # NOTE:
  # In case the last command is a blank one on the settings menu, that last 
  # blank space will be also removed if you use the above 2 settings.
  #-----------------------------------------------------------------------------  
  TitleAdd = {
    :enable => true,
    :index => 2,
    :name => "Options",
    :remove_title => false,
    :remove_exit => true,
  }
  
  #-----------------------------------------------------------------------------
  # Default Settings:
  #-----------------------------------------------------------------------------  
  # And this is where you will setup all the default settings for your game.
  # The game will start with these settings when it is launched at the 1st time.
  # The "Default Settings" button in the options menu will also load these
  # settings (if you use that button).
  # 
  # NOTE:
  # All of the default settings you may have set up in Yanfly's script are now
  # discarded! The ones you setup here will be used instead!
  # Same for my PC Clock Display script, the starting settings will be loaded
  # from here now!
  # 
  # NOTE2:
  # From v1.1, all of these settings are optional! If you don't set up them,
  # the default values for them will be loaded from the related scripts instead!
  # Switches and variables used on the settings scene will default to false,
  # all the volume control options will default to 100 (meaning 100%), and
  # the other settings will read their default value from the relevant sources
  # (windowskin from the database settings, Yanfly options from his script and
  # PC clock options from my script).
  # If you enter new values for them here, those will be used instead!
  #
  # I think, all of the settings are obvious enough. But just to make sure, I 
  # will write some details here:
  #
  # - Yanfly's Default Options:
  # :bgm, :bgs, :sfx - Values: 0 - 100 (percentages).
  # :autodash, :instantmsg, :animations - Values: true/false (enabled/disabled).
  # :window_tone - Format: Tone.new(R,G,B,0), Color values: -255 - 255.
  #
  # - PC Clock Display Options:
  # :timer_pos - Related Setting: Position_Setup
  # :timer_skin - Related Setting: Windowskin_Setup
  # :timer_color - Related Setting: Color_Setup
  # :timer_back - Related Setting: Background_Setup
  # Check the details for these in my PC Clock Display - YF System Options Addon
  # script! You can find information about these settings at the above marked 
  # related settings explanations.
  # Even if you don't use my PC Clock Display script, you don't need to remove 
  # these settings if you don't want to, they won't do anything in your game.
  #
  # - Switch Options:
  # You must enter all the switches you want to use as a global setting here!
  # The format is:
  #   switch_id => true/false,
  # Replace the switch_id with any switch ID you want.
  # true means that it will turned ON, false means that it will be turned OFF.
  # You should NOT use these switches for anything else in your game or weird
  # things might happen! You have been warned! :P
  # I added some switch settings as samples already. They use the same IDs like
  # my PC Clock Display script (for toggling some HUD elements). Disabled them
  # because it's not really necessary to add them here anymore, but if you 
  # want to change their default value (which is false), you can still use them.
  # Aside from that, any switch you add here will become a global one, 
  # regardless if you use them for your settings or not. Imagine that something
  # happens in one of your game, turns on a global switch, and that something
  # now affected all games started too, regardless if they are saved in a 
  # different save slot or if it's a new game entirely. Some cool stuffs can
  # be made with this for sure, right? :P
  # 
  #
  # - Variable Options:
  # Much like the switch settings, you must enter all the variables you want to
  # use as global settings here!
  # The format is:
  #   variable_id => value,
  # Replace the variable_id with the ID of the variable you want to use.
  # And the value can be any numeric value, just make sure that it is within
  # the minimum and maximum value limits you have set up in Yanfly's script for
  # the variable option or weird things will happen!
  # Again, do NOT use these variables for anything else in your game!
  # And just like global switches, these can be used even if they don't appear 
  # on the settings scene for eventing purposes.
  #
  # - Self Switch Options:
  # Hahh, gotcha! No, currently, there is no way to add a setting based on self
  # switches. However, if you want to start your game with some self-switches
  # already enabled, or if you want to disable some self-switches already 
  # enabled in a saved game, but you don't want to edit your events, you can
  # use this if you want.
  # The format is:
  #   [map_id,event_id,'sswitch_letter'] = true/false,
  # Replace the map_id with the ID of the map the event is on.
  # Replace event_id with the ID of the event you want to change.
  # Replace 'sswitch_letter' with the self-switch letter: 'A'/'B'/'C'/'D'.
  # true means that it will be turned ON, false means that it will be turned 
  # OFF. You can enter as many as you want!
  # Note that if you want to use this, you must turn the 'Reload' setting to 
  # true, or else the newly added self-switch settings will NOT be effective!
  # Also, make sure to remove these settings when you ship your game or else...
  # Yeah, weird things may happen in your game! :P
  # Or if you would like to actually save these self-switches across all games
  # (saved games or newly started ones), don't remove them, and they will
  # become global self-switches for your eventing purposes.
  #-----------------------------------------------------------------------------  
  Defaults = {
    # Default options:
#~     :volume_bgm => 100,
#~     :volume_bgs => 100,
#~     :volume_sfx => 100,
#~     :bgm => 80,
#~     :bgs => 70,
#~     :sfx => 60,
#~     :autodash => true,
#~     :instantmsg => true,
#~     :animations => true,
#~     :window_tone => Tone.new(-100,-50,-100,0),
    # --- Requires my PC Timer Display - YF System Options Addon script! ---
#~     :timer_pos => [0,0],
#~     :timer_skin => "Window",
#~     :timer_color => 17,
#~     :timer_back => "timerbackv1",
    # --- End of timer display options! ---
    :switches => { # Switch settings:
#~       33 => true,
#~       134 => true,
#~       135 => true,
      # Add new switch settings here!
    },
    :variables => { # Variable settings:
      # Add new variable settings here!
    },
    :selfswitches => { # Self-switch settings:
      # Add new self-switch settings here!
    },
  }
  
#===============================================================================
# End of settings! O.o
#===============================================================================

  def self.init
    file = self.check_sys_file
    if File.exist?(file) && !Reload
      $data_options = load_data(file)
    else
      self.load_defaults
      save_data($data_options, file)
    end
  end
  
  def self.check_sys_file
    file = ""
    file += DPath + "\\" unless DPath.empty?
    SPath.each do |path|
      file += path + "\\"
      Dir.mkdir(file) if !FileTest.exist?(file)
    end
    file += FileName
    return file
  end
  
  def self.load_system_settings
    file = self.check_sys_file
    $data_options = load_data(file)
  end
  
  def self.load_defaults
    $data_options = Marshal.load(Marshal.dump(Defaults))
    load_def_data(:bgm,100,$data_options[:bgm].nil?)
    load_def_data(:bgs,100,$data_options[:bgs].nil?)
    load_def_data(:sfx,100,$data_options[:sfx].nil?)
    load_def_data(:autodash,YEA::SYSTEM::DEFAULT_AUTODASH,$data_options[:autodash].nil?)
    load_def_data(:instantmsg,YEA::SYSTEM::DEFAULT_INSTANTMSG,$data_options[:instantmsg].nil?)
    load_def_data(:animations,YEA::SYSTEM::DEFAULT_ANIMATIONS,$data_options[:animations].nil?)
    if $imported["SixthPCTimerYFOptions"]
      load_def_data(:timer_pos,Sixth_RTime_HUD::Position_Setup.values[0],$data_options[:timer_pos].nil?)
      load_def_data(:timer_skin,Sixth_RTime_HUD::Windowskin_Setup.values[0],$data_options[:timer_skin].nil?)
      load_def_data(:timer_color,Sixth_RTime_HUD::Color_Setup.values[0],$data_options[:timer_color].nil?)
      load_def_data(:timer_back,Sixth_RTime_HUD::Background_Setup.values[0],$data_options[:timer_back].nil?)
    end
    if $data_options[:window_tone].nil?
      ori_sys = $BTEST ? load_data("Data/BT_System.rvdata2") : load_data("Data/System.rvdata2")
      $data_options[:window_tone] = ori_sys.window_tone
    end
  end
  
  def self.load_def_data(type,data,cond)
    $data_options[type] = data if cond
  end
  
  def self.save_system_settings
    file = self.check_sys_file
    save_data($data_options, file)
  end
     
end

module DataManager

  class << self; alias add_def_sys_values5598 create_game_objects; end
  def self.create_game_objects
    add_def_sys_values5598
    set_def_sys_values
  end

  def self.set_def_sys_values
    self.add_stuffs_from_yf_opts
    $data_options[:switches].each do |id,val|
      if id.is_a?(Array)
        id.each {|iid| $game_switches[iid] = val }
      else
        $game_switches[id] = val
      end
    end
    $data_options[:variables].each do |id,val|
      if id.is_a?(Array)
        id.each {|iid| $game_variables[iid] = val }
      else
        $game_variables[id] = val
      end
    end
    $data_options[:selfswitches].each do |id,val|
      $game_self_switches[id] = val
    end
  end
  
  def self.add_stuffs_from_yf_opts
    YEA::SYSTEM::CUSTOM_SWITCHES.each do |sym,data|
      next unless $data_options[:switches][data[0]].nil?
      $data_options[:switches][data[0]] = false
    end
    YEA::SYSTEM::CUSTOM_VARIABLES.each do |sym,data|
      next unless $data_options[:variables][data[0]].nil?
      $data_options[:variables][data[0]] = false
    end
  end
  
end

module SceneManager

  class << self; alias init_sys_settings1287 run; end
  def self.run
    YanSysOptAdd.init
    init_sys_settings1287
  end
  
end

class Game_Switches
    
  alias make_em_global1092 []=
  def []=(id, value)
    make_em_global1092(id, value)
    if $data_options[:switches].include?(id)
      $data_options[:switches][id] = value
      YanSysOptAdd.save_system_settings unless SceneManager.scene_is?(Scene_System)
    end
  end
  
end

class Game_Variables
    
  alias make_em_global2232 []=
  def []=(id, value)
    make_em_global2232(id, value)
    if $data_options[:variables].include?(id)
      $data_options[:variables][id] = value
      YanSysOptAdd.save_system_settings unless SceneManager.scene_is?(Scene_System)
    end
  end
  
end

class Game_SelfSwitches
    
  alias make_em_global1092 []=
  def []=(id, value)
    make_em_global1092(id, value)
    if $data_options[:selfswitches].include?(id)
      $data_options[:selfswitches][id] = value
      YanSysOptAdd.save_system_settings unless SceneManager.scene_is?(Scene_System)
    end
  end
  
end

class Game_System
    
  def volume(type)
    return $data_options[type]
  end
  
  def volume_change(type, increment)
    $data_options[type] += increment
    $data_options[type] = [[$data_options[type], 0].max, 100].min
  end
  
  def window_tone
    return $data_options[:window_tone]
  end
  
  def window_tone=(window_tone)
    $data_options[:window_tone] = window_tone
  end
    
  def autodash?
    return $data_options[:autodash]
  end

  def instantmsg?
    return $data_options[:instantmsg]
  end
  
  def animations?
    return $data_options[:animations]
  end

  def set_autodash(value)
    $data_options[:autodash] = value
  end
   
  def set_instantmsg(value)
    $data_options[:instantmsg] = value
  end
  
  def set_animations(value)
    $data_options[:animations] = value
  end
  
  def rtime_pos
    return $data_options[:timer_pos]
  end
  
  def rtime_color
    return $data_options[:timer_color]
  end
  
  def rtime_skin
    return $data_options[:timer_skin]
  end
  
  def rtime_back
    return $data_options[:timer_back]
  end

  def rtime_pos=(val)
    $data_options[:timer_pos] = val
  end
  
  def rtime_color=(val)
    $data_options[:timer_color] = val
  end
  
  def rtime_skin=(val)
    $data_options[:timer_skin] = val
  end

  def rtime_back=(val)
    $data_options[:timer_back] = val
  end  
  
end

class Window_SystemOptions < Window_Command
  
  alias fix_new_btns8811 ok_enabled?
  def ok_enabled?
    return true if [:revert, :default].include?(current_symbol)
    return fix_new_btns8811
  end
  
  alias hide_some_opts6615 make_command_list
  def make_command_list
    hide_some_opts6615
    hide_exit_opts if SceneManager.scene.on_title
  end
  
  def hide_exit_opts
    flags = SceneManager.scene.on_title
    if flags[0]
      op = {:name => YEA::SYSTEM::COMMAND_VOCAB[:to_title][0], 
            :symbol=> :to_title, :enabled => true, :ext => nil}
      @list.delete(op)
    end
    if flags[1]
      op = {:name => YEA::SYSTEM::COMMAND_VOCAB[:shutdown][0], 
            :symbol=> :shutdown, :enabled => true, :ext => nil}
      @list.delete(op)
    end
    @list.pop if (flags[0] || flags[1]) && @list[-1][:symbol] == :blank
  end
    
  alias add_new_commands2218 process_custom_switch
  def process_custom_switch(sym)
    case sym
    when :revert, :default
      add_command(YanSysOptAdd::NewButtons[sym][:name], sym)
      @help_descriptions[sym] = YanSysOptAdd::NewButtons[sym][:description]
    else
      add_new_commands2218(sym)
    end
  end
  
  alias sixth_add_new_btns9917 draw_item
  def draw_item(index)
    rect = item_rect(index)
    sixth_add_new_btns9917(index)
    case @list[index][:symbol]
    when :revert, :default;   draw_new_opt_buttons(rect,index)
    end
  end

  def draw_new_opt_buttons(rect,index)
    change_color(normal_color, command_enabled?(index))
    draw_text(rect, command_name(index), 1)
  end
    
end

class Scene_System < Scene_MenuBase

  def on_title
    return @on_title
  end
  
  alias backup_settings7715 start
  def start
    @old_settings = Marshal.load(Marshal.dump($data_options))
    backup_settings7715
  end
  
  def prepare(title_flag=false,exit_flag=false)
    @on_title = [title_flag,exit_flag]
  end
  
  alias add_new_buttons7761 create_command_window
  def create_command_window
    add_new_buttons7761
    @command_window.set_handler(:revert, method(:revert_changes))
    @command_window.set_handler(:default, method(:set_defaults))
  end
  
  def revert_changes
    $data_options = Marshal.load(Marshal.dump(@old_settings))
    DataManager.set_def_sys_values
    @command_window.refresh
    @command_window.activate
  end
  
  def set_defaults
    YanSysOptAdd.load_defaults
    DataManager.set_def_sys_values
    @command_window.refresh
    @command_window.activate
  end
  
  def dispose_all_windows
    YanSysOptAdd.save_system_settings if @old_settings != $data_options
    super
  end
  
  alias save_settings6151 command_to_title
  def command_to_title
    if @on_title
      return_scene
    else
      save_settings6151
    end
  end

end

class Window_TitleCommand < Window_Command

  alias add_opt_btn9917 make_command_list
  def make_command_list
    add_opt_btn9917
    add_options_button if YanSysOptAdd::TitleAdd[:enable]
  end
  
  def add_options_button
    cmd = {
      :name => YanSysOptAdd::TitleAdd[:name], 
      :symbol=> :options, :enabled => true, :ext => nil
    }
    @list.insert(YanSysOptAdd::TitleAdd[:index],cmd)
  end
  
end

class Scene_Title < Scene_Base
  
  alias add_opt_button8871 create_command_window
  def create_command_window
    add_opt_button8871
    @command_window.set_handler(:options, method(:command_options))
  end
  
  def command_options
    SceneManager.call(Scene_System)
    rem1 = YanSysOptAdd::TitleAdd[:remove_title]
    rem2 = YanSysOptAdd::TitleAdd[:remove_exit]
    SceneManager.scene.prepare(rem1,rem2)
  end
    
end
#==============================================================================
# !!END OF SCRIPT - OHH, NOES!!
#==============================================================================
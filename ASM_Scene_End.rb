#==============================================================================
# ** Always Sometimes Monsters: Scene_End
#------------------------------------------------------------------------------
#  This is the quit game menu scene class for ASM
#==============================================================================

class Scene_End < Scene_MenuBase
  def terminate
    super
    dispose_windows
  end
  
  def update
    super
    update_windows
  end
  
  #--------------------------------------------------------------------------#
  # * Window and command functions
  #--------------------------------------------------------------------------#
  def create_command_window
    @command_window = ASM_Window_QuitCommand.new((Graphics.width / 2) - 153, (Graphics.height / 2) - 45, 10)
    @command_window.set_handler(:returngame,    method(:return_scene))
    @command_window.set_handler(:titlescreen,   method(:command_to_title))
    @command_window.set_handler(:shutdown,      method(:command_shutdown))
    @command_window.set_handler(:desktop,       method(:command_desktop))
    @command_window.set_handler(:cancel,        method(:return_scene))
    open_windows
  end
  
  def open_windows
    @command_window.open
    @command_window.activate
  end
  
  def update_windows
    @command_window.update if !@command_window.nil?
  end
  
  def close_windows
    @command_window.close
    update until @command_window.close?
  end
  
  def dispose_windows
    @command_window.dispose if !@command_window.nil?
  end
  
  #--------------------------------------------------------------------------
  # * [Desktop] Command
  #--------------------------------------------------------------------------
  def command_desktop
    close_command_window
    fadeout_all
    SceneManager.clear
    SceneManager.exit
  end
end